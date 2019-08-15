//
//  HistoryDetailProtocols.swift
//  DriveRecords
//
//  Created by Hamza Khan on 06/08/2019.
//  Copyright © 2019 Hamza Khan. All rights reserved.
//

import Foundation
import UIKit
protocol HistoryDetailViewToPresenterProtocol{
    var view : HistoryDetailPresenterToViewProtocol? { get set}
    var interactor : HistoryDetailPresenterToInteractorProtocol? { get set }
    var router : HistoryDetailPresenterToRouterProtocol? { get set }
    func viewHasLoaded(item : RideRecord)
}

protocol HistoryDetailPresenterToViewProtocol {
    func setRideRecord(customerName : String , distance : String , duration : String , date : String)
}

protocol HistoryDetailInteractorToPresenterProtocol{
    func didProcessRideRecord(customerName : String , distance : String , duration : String , date : String)
}

protocol HistoryDetailPresenterToInteractorProtocol {
    var presenter : HistoryDetailInteractorToPresenterProtocol? { get set }
    func processRideRecrod(item : RideRecord)
}

protocol HistoryDetailPresenterToRouterProtocol {
    static func createModule(record : RideRecord) -> UIViewController
}
