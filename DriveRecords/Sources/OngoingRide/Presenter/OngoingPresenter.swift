//
//  OngoingPresenter.swift
//  DriveRecords
//
//  Created by Hamza Khan on 05/08/2019.
//  Copyright © 2019 Hamza Khan. All rights reserved.
//

import Foundation

class OngoingPresenter : OngoingViewToPresenterProtocol {
   
    var tripDuration : String = ""
    var tripDistance : String = ""
    var currentDate : Date = Date()
    
    func saveRecord(passengerName: String) {
           interactor?.saveRecord(passengerName, completed: true, duration: tripDuration, date: currentDate, distance: tripDistance)
    }
  
    func viewDidDisappear() {
        interactor?.stopTimer()
    }
    func stopRide() {
        
    }
    func viewHasLoaded() {
        
        interactor?.startTimer()
        interactor?.trackLocationWithDistance()
        
    }
    
    var view: OngoingPresenterToViewProtocol?
    var interactor: OngoingPresenterToInteractorProtocol?
    var router: OngoingPresenterToRouterProtocol?
    
    
    
}
extension OngoingPresenter : OngoingInteractorToPresenterProtocol{
    func didSaveRecord() {
        view?.didSaveRecord()
    }
    
    func getDistanceTravelled(value: String) {
        tripDistance = value
        let distance = Utility.formatDistanceValue(val: tripDistance)
        view?.getDistanceTravelled(value: distance)
    }
    
   
    
    func timerStarted(value: String) {
        tripDuration = value
        view?.getTimerValue(value: value)
    }
    
   
    
}
