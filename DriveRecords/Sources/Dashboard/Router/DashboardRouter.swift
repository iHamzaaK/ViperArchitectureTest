//
//  DashboardRouter.swift
//  DriveRecords
//
//  Created by Hamza Khan on 05/08/2019.
//  Copyright © 2019 Hamza Khan. All rights reserved.
//

import Foundation
import UIKit

class DashboardRouter : DashboardPresenterToRouterProtocol {
    func goToHistory(records : [[RideRecord]],navigationController: UINavigationController) {
        let historyVC = HistoryRouter.createModule(records: records)
        navigationController.pushViewController(historyVC, animated: true)

    }
    
    func startRide(navigationController: UINavigationController) {
        let ongoingRideVC = OngoingRouter.createModule()
        navigationController.pushViewController(ongoingRideVC, animated: true)
    }
    
    static func createModule() -> UIViewController {
        let view = dashboardStoryboaord.instantiateViewController(withIdentifier: "DashboardViewController") as! DashboardViewController
        let presenter : DashboardViewToPresenterProtocol & DashboardInterectorToPresenterProtocol = DashboardPresenter()
        let interactor : DashboardPresenterToInterectorProtocol = DashboardInteractor()
        let router : DashboardPresenterToRouterProtocol = DashboardRouter()
        let localDataManager: RideRecordListPersistenceManagerInputDelegate = RideRecordLocalDataManager()

        view.presenter = presenter
        presenter.interector = interactor
        presenter.router = router
        presenter.view =  view
        interactor.presenter = presenter
        interactor.dataManager = localDataManager

        return view
    }
    
    
    static var dashboardStoryboaord : UIStoryboard{
        return UIStoryboard(name: "Dashboard", bundle: Bundle.main)
    }
}
