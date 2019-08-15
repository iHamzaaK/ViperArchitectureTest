//
//  OngoingRideProtocol.swift
//  DriveRecords
//
//  Created by Hamza Khan on 05/08/2019.
//  Copyright © 2019 Hamza Khan. All rights reserved.
//

import Foundation
import  UIKit
import CoreLocation


protocol OngoingPresenterToViewProtocol : class {
    func getTimerValue(value : String)
    func getDistanceTravelled(value: String)
    func didSaveRecord()
}

protocol OngoingViewToPresenterProtocol : class {
    var view : OngoingPresenterToViewProtocol? { get set}
    var interactor : OngoingPresenterToInteractorProtocol? { get set }
    var router: OngoingPresenterToRouterProtocol? { get set }
    func viewHasLoaded()
    func saveRecord(passengerName : String)
    func stopRide()
    func viewDidDisappear()
}

protocol OngoingInteractorToPresenterProtocol: class {
    func timerStarted(value : String)
    func getDistanceTravelled(value : String)
    func didSaveRecord()
}

protocol OngoingPresenterToInteractorProtocol: class {
    var presenter : OngoingInteractorToPresenterProtocol? { get set }
    var locationManager: LocationManagerDelegate? { get set }
    var dataManager: RideRecordListPersistenceManagerInputDelegate? { get set }

    func startTimer()
    func stopTimer()
    func saveRecord(_ title : String , completed: Bool, duration : String , date : Date , distance : String)
    func trackLocationWithDistance()

}

protocol OngoingPresenterToRouterProtocol {
    static func createModule() -> UIViewController
    
}
