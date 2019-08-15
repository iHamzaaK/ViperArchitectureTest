//
//  DashboardPresenter.swift
//  DriveRecords
//
//  Created by Hamza Khan on 05/08/2019.
//  Copyright © 2019 Hamza Khan. All rights reserved.
//

import Foundation
import UIKit

class DashboardPresenter : DashboardViewToPresenterProtocol{
  
    var view : DashboardPresenterToViewProtocol?
    var interector: DashboardPresenterToInterectorProtocol?
    var router: DashboardPresenterToRouterProtocol?
    
    func startRide(navigationController : UINavigationController){
        router?.startRide(navigationController:  navigationController)
    }
    func goToHistory(records : [[RideRecord]],navigationController: UINavigationController) {
        router?.goToHistory(records: records, navigationController: navigationController)
        
    }
    
    func viewHasLoaded() {
        interector?.retrieveData()
    }
    
}

extension DashboardPresenter: DashboardInterectorToPresenterProtocol{
    func getDistances(currentMonthDistance: String, totalDistance: String, month: String) {
        view?.getDistances(currentMonthDistance: currentMonthDistance, totalDistance: totalDistance, month: month)

    }
    
  
    
    func didRetrieveRecords(records: [[RideRecord]]) {
        view?.didRetrieveRecords(records: records)
    }
    
}


