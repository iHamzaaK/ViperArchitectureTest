//
//  HistoryInteractor.swift
//  DriveRecords
//
//  Created by Hamza Khan on 05/08/2019.
//  Copyright © 2019 Hamza Khan. All rights reserved.
//

import Foundation

class HistoryInteractor : HistoryPresenterToInteractorProtocol{
   
    
    
    var dataManager: RideRecordListPersistenceManagerInputDelegate?
    var presenter: HistoryInteractorToPresenterProtocol?
    
    func convertToCSV() {
        let strCSV = exportCSVString()
        if strCSV == "" {
            presenter?.failedToConvertCSV()
        }
        else{
            let csvPath = convertCSVStringToFileWithPath(csvString: strCSV)
            presenter?.didConverToCSV(path: csvPath)
        }
    }
    func convertCSVStringToFileWithPath(csvString: String)-> String{
        let exportFilePath = NSTemporaryDirectory() + "RideRecords.csv"
        let exportFileURL = URL(fileURLWithPath: exportFilePath)
        FileManager.default.createFile(atPath: exportFilePath, contents: Data(), attributes: nil)
        var fileHandleError : NSError? = nil
        var fileHandle : FileHandle? = nil
        do{
            fileHandle = try FileHandle(forWritingTo: exportFileURL)
        } catch{
            print("Error while creating file")
        }
        if fileHandle != nil{
            fileHandle?.seekToEndOfFile()
            let csvData = csvString.data(using: .utf8, allowLossyConversion: false)
            fileHandle?.write(csvData!)
            fileHandle?.closeFile()
            return exportFilePath
            
        }
        return ""
    }
    
        
    func exportCSVString() -> String{
        var export : String  = NSLocalizedString("Date, Name, Total Distance, Total Duration \n", comment: "")
        let records = getAllRecords()
        if records.count < 1{
            return ""
        }
        for record in records{
            let strName = record.studentName ?? ""
            let strDate = record.date?.toString() ?? ""
            let strDuration = record.duration ?? "00:00"
            let strDistance = Utility.formatDistanceValue(val: record.distance ?? "")
            
            export += strDate + "," + strName + "," + strDistance + "," + strDuration + "\n"
            }
            print(export)
            return export
            
    }
    func getAllRecords() -> [RideRecord]{
            do {
                if let rideRecord = try dataManager?.retrieveTodoList() {
                    if !rideRecord.isEmpty{
                        return rideRecord
                    }
                    else{
                        return []
                    }
                }
            }
            catch{
                return []

            }
        return []
    }
}

