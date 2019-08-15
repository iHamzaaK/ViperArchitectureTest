//
//  HistoryRouter.swift
//  DriveRecords
//
//  Created by Hamza Khan on 05/08/2019.
//  Copyright © 2019 Hamza Khan. All rights reserved.
//

import Foundation
import UIKit

class HistoryRouter : HistoryPresenterToRouterProtocol{
    static func createModule(records : [[RideRecord]]) -> UIViewController {
        let view = historyStoryboard.instantiateViewController(withIdentifier: "HistoryViewController") as! HistoryViewController
        var presenter : HistoryViewToPresenterProtocol & HistoryInteractorToPresenterProtocol = HistoryPresenter()
        var interactor : HistoryPresenterToInteractorProtocol = HistoryInteractor()
        let router : HistoryPresenterToRouterProtocol = HistoryRouter()
        let localDataManager: RideRecordListPersistenceManagerInputDelegate = RideRecordLocalDataManager()
        view.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
        presenter.view =  view
        interactor.presenter = presenter
        interactor.dataManager = localDataManager
        view.items = records
        return view
    }
    static var historyStoryboard : UIStoryboard{
        return UIStoryboard(name: "History", bundle: Bundle.main)
    }
}
