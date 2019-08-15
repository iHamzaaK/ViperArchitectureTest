//
//  HistoryDetailPresenter.swift
//  DriveRecords
//
//  Created by Hamza Khan on 06/08/2019.
//  Copyright © 2019 Hamza Khan. All rights reserved.
//

import Foundation


class HistoryDetailPresenter: HistoryDetailViewToPresenterProtocol {
    var view: HistoryDetailPresenterToViewProtocol?
    
    var interactor: HistoryDetailPresenterToInteractorProtocol?
    
    var router: HistoryDetailPresenterToRouterProtocol?
    
    func viewHasLoaded(item: RideRecord) {
        interactor?.processRideRecrod(item: item)
    }
    
    
}

extension HistoryDetailPresenter : HistoryDetailInteractorToPresenterProtocol{
    func didProcessRideRecord(customerName: String, distance: String, duration: String, date: String) {
        view?.setRideRecord(customerName: customerName, distance: distance, duration: duration, date: date)
    }
    
    
}
