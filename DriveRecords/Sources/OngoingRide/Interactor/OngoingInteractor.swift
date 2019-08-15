//
//  OngoingInteractor.swift
//  DriveRecords
//
//  Created by Hamza Khan on 05/08/2019.
//  Copyright © 2019 Hamza Khan. All rights reserved.
//

import Foundation
import CoreLocation
import INTULocationManager
class OngoingInteractor : OngoingPresenterToInteractorProtocol{
    var dataManager: RideRecordListPersistenceManagerInputDelegate?
    var locationManager: LocationManagerDelegate?
    var presenter: OngoingInteractorToPresenterProtocol?

    private var startLocation: CLLocation!
    private var lastLocation: CLLocation!
    private var traveledDistance: Double = 0
    private var timer : Timer!
    private var start = Date()
    private var timeElapsed = String()
    private var fractions: Int = 0
    private var seconds: Int = 0
    private var minutes: Int = 0
    
    func stopTimer(){
        timer?.invalidate()
    }
    func startTimer(){
        start = Date()
        timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true, block: { (this) in
            self.performActiveTimer()
            self.presenter?.timerStarted(value : self.timeElapsed)
        })
    }
    func saveRecord(_ title: String, completed: Bool, duration: String, date: Date, distance: String) {
        let item = RideRecord(context: PersistenceService.context)
        item.studentName = title
        item.completed = completed
        item.distance = distance
        item.duration = duration
        item.date = date
        do {
            try dataManager?.save(item: item)
            presenter?.didSaveRecord()
        } catch let error as NSError {
                print(error)
        }
    }
    
    func trackLocationWithDistance() {
        let locationManager = INTULocationManager.sharedInstance()
        locationManager.subscribeToLocationUpdates(withDesiredAccuracy: .room)  { (location, accuracy, status) in
            if (status == INTULocationStatus.success){
                guard let userLocation = location else { return }
                if self.startLocation == nil{
                        self.startLocation = userLocation
                }
                else{
                        self.lastLocation = userLocation
                        self.traveledDistance += self.lastLocation.distance(from: self.startLocation)
                        self.startLocation = self.lastLocation
                        self.presenter?.getDistanceTravelled(value: self.traveledDistance.roundTo(places: 2).toString())
                }
            }
            else{
                print("problem")
            }
        }
       
    }

    deinit{
        print("OngoingInteractor deinited")  // get's printed
    }
}

//extension OngoingInteractor : LocationManagerDelegate{
//    func locationManager(_ manager: LocationManagerInterface, didUpdateLocations locations: [CLLocation]) {
//        print(locations.first)
//    }
//
//    func locationManager(_ manager: LocationManagerInterface, didChangeAuthorization status: CLAuthorizationStatus) {
//        switch status {
//        case .authorizedAlways:
//            print("Hello")
//        default:
//            print("Not working")
//        }
//    }
//
//
//}

//Timer function
extension OngoingInteractor {
    private func performActiveTimer() {
        fractions += 1
        if fractions == 100 {
            fractions = 0
            seconds += 1
        }
        if seconds == 60 {
            seconds = 0
            minutes += 1
        }
        let fracStr: String = fractions > 9 ? "\(fractions)" : "0\(fractions)"
        let secStr: String = seconds > 9 ? "\(seconds)" : "0\(seconds)"
        let minStr: String = minutes > 9 ? "\(minutes)" : "0\(minutes)"
        timeElapsed = "\(minStr):\(secStr).\(fracStr)"
    }
}
