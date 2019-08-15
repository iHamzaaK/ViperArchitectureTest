//
//  DashboardProtocols.swift
//  DriveRecords
//
//  Created by Hamza Khan on 05/08/2019.
//  Copyright © 2019 Hamza Khan. All rights reserved.
//

import Foundation
import UIKit


protocol DashboardPresenterToViewProtocol: class {
    func didRetrieveRecords(records : [[RideRecord]])
    func getDistances(currentMonthDistance : String , totalDistance: String, month: String)

}

protocol DashboardViewToPresenterProtocol : class {
    var view: DashboardPresenterToViewProtocol? {get set};
    var interector: DashboardPresenterToInterectorProtocol? {get set};
    var router: DashboardPresenterToRouterProtocol? {get set}
    func startRide(navigationController : UINavigationController)
    func goToHistory(records: [[RideRecord]] ,navigationController : UINavigationController)
    func viewHasLoaded()

//    func updateView();
}

protocol DashboardInterectorToPresenterProtocol: class {
    func didRetrieveRecords(records : [[RideRecord]])
    func getDistances(currentMonthDistance : String , totalDistance: String, month : String)
    
}

protocol DashboardPresenterToInterectorProtocol : class {
    var presenter: DashboardInterectorToPresenterProtocol? {get set} ;
    var dataManager: RideRecordListPersistenceManagerInputDelegate? { get set }

    func retrieveData()
}

protocol DashboardPresenterToRouterProtocol : class{
    static func createModule() -> UIViewController;
    func startRide(navigationController : UINavigationController)
    func goToHistory(records: [[RideRecord]] ,navigationController : UINavigationController)

    
}
