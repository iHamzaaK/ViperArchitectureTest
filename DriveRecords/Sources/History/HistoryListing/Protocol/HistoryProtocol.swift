//
//  HistoryProtocol.swift
//  DriveRecords
//
//  Created by Hamza Khan on 05/08/2019.
//  Copyright © 2019 Hamza Khan. All rights reserved.
//

import Foundation
import UIKit
protocol HistoryPresenterToViewProtocol {
    func pathCSV(path : String)
    func failedToConvertCSV()
}
protocol HistoryViewToPresenterProtocol {
    var view : HistoryPresenterToViewProtocol? {get set}
    var interactor : HistoryPresenterToInteractorProtocol? { get set}
    var router : HistoryPresenterToRouterProtocol? { get set}
    func viewHasLoaded(navItem : UINavigationItem)
    func goToHistoryDetail(record : RideRecord, navigationController : UINavigationController)
}
protocol HistoryPresenterToInteractorProtocol {
    var presenter : HistoryInteractorToPresenterProtocol? { get set }
    var dataManager: RideRecordListPersistenceManagerInputDelegate? { get set }
    func convertToCSV()
}
protocol HistoryInteractorToPresenterProtocol {
    func didConverToCSV(path: String)
    func failedToConvertCSV()
}
protocol HistoryPresenterToRouterProtocol {
    static func createModule(records : [[RideRecord]]) -> UIViewController
}
