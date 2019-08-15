//
//  DashboardInteractor.swift
//  DriveRecords
//
//  Created by Hamza Khan on 05/08/2019.
//  Copyright © 2019 Hamza Khan. All rights reserved.
//

import Foundation

class DashboardInteractor: DashboardPresenterToInterectorProtocol {
    var dataManager: RideRecordListPersistenceManagerInputDelegate?
    
    var presenter: DashboardInterectorToPresenterProtocol?
    func retrieveData() {
        do {
            if let rideRecord = try dataManager?.retrieveTodoList() {
                if !rideRecord.isEmpty {
                    let records = sortRecords(arr: rideRecord)
                    getDistanceTotalAndCurrentMonth(records: records)
                    presenter?.didRetrieveRecords(records: records)
                } else {
                    presenter?.didRetrieveRecords(records: [[]])
                }
            }
        } catch {
            presenter?.didRetrieveRecords(records: [[]])

        }
    }
    private func sortRecords(arr: [RideRecord])-> [[RideRecord]]{
        
        var sortedRecords: [[RideRecord]] = []
        
        // a filter to filter months by a given integer, you could also pull rawDates out of the equation here, to make it pure functional
        let filterFromDatesByMonth = { month in arr.filter { $0.date!.month == month } }
        
        // loop through the months in a calendar and for every month filter the dates and append them to the array
        (1...12).forEach { sortedRecords.append(filterFromDatesByMonth($0)) }
        
        
        return sortedRecords
    }
    
    func getDistanceTotalAndCurrentMonth(records : [[RideRecord]]){
        let totalMonthTime = getCurrentMonthAndDistance(records: records).0
        let monthName = getCurrentMonthAndDistance(records: records).1

        let totalTime = getTotalDistance(records: records)
        presenter?.getDistances(currentMonthDistance: totalMonthTime, totalDistance: totalTime, month: monthName)
    }
    
    func getTotalDistance(records :[[RideRecord]])-> String{
      let totalDistance =   records.map { (arr) -> Double in
        
            return arr.map { (record) -> Double in
                
                return record.distance!.toDouble()
                }.reduce(0, {
                    
                    $0 + $1
                    
                })
        }.reduce(0, {$0+$1})
        return Utility.formatDistanceValue(val: totalDistance.toString())
        
    }
    func getCurrentMonthAndDistance(records : [[RideRecord]] )-> (String, String){
        let date = Date()
        let calendar = Calendar.current
        let month = calendar.component(.month, from: date)
        let monthName = Utility.convertIntToMonthString(month: month)
        //12
        if month <= records.count{
            let currentMonthRecord = records[month-1]
            let distance =  currentMonthRecord.map { (record) -> Double in
                return record.distance!.toDouble()
                }.reduce(0, {
                    $0 + $1
                })
            return (Utility.formatDistanceValue(val: distance.toString()), monthName)
            }
        else{
            return (Utility.formatDistanceValue(val: ""),monthName)
        }
    }
    
}


