//
//  OngoingRouter.swift
//  DriveRecords
//
//  Created by Hamza Khan on 05/08/2019.
//  Copyright © 2019 Hamza Khan. All rights reserved.
//

import Foundation
import UIKit
class OngoingRouter : OngoingPresenterToRouterProtocol{
    
    static var OngoingStoryboard : UIStoryboard{
        return UIStoryboard(name: "Ongoing", bundle: Bundle.main)
    }
    static func createModule() -> UIViewController{
        let view = OngoingStoryboard.instantiateViewController(withIdentifier: "OngoingViewController") as! OngoingViewController
        let presenter : OngoingViewToPresenterProtocol & OngoingInteractorToPresenterProtocol  = OngoingPresenter()
        let interactor : OngoingPresenterToInteractorProtocol = OngoingInteractor()
        let router       : OngoingPresenterToRouterProtocol = OngoingRouter()
//        let location : LocationManagerDelegate = LocationService()
        let localDataManager: RideRecordListPersistenceManagerInputDelegate = RideRecordLocalDataManager()

        view.presenter = presenter
        presenter.interactor = interactor
        presenter.view = view
        presenter.router = router
        interactor.presenter = presenter
        interactor.dataManager = localDataManager
        
        
        return view
        
    }
    
}
