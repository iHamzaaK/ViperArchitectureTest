//
//  HistoryPresenter.swift
//  DriveRecords
//
//  Created by Hamza Khan on 05/08/2019.
//  Copyright © 2019 Hamza Khan. All rights reserved.
//

import Foundation
import UIKit
class HistoryPresenter: HistoryViewToPresenterProtocol {
    func goToHistoryDetail(record: RideRecord,navigationController : UINavigationController) {
        let historyDetailVC = HistoryDetailRouter.createModule(record: record)
        navigationController.pushViewController(historyDetailVC, animated: true)
    }
    
    func addExportCSVNavButton(navItem : UINavigationItem){
        let export = UIBarButtonItem(title: "Export CSV", style: .plain, target: self, action: #selector(didTapOnExport))
        navItem.rightBarButtonItem = export
    }
    @objc func didTapOnExport(){
        interactor?.convertToCSV()

    }
    func viewHasLoaded(navItem : UINavigationItem) {
        addExportCSVNavButton(navItem : navItem)
    }
    
    var view: HistoryPresenterToViewProtocol?
    
    var interactor: HistoryPresenterToInteractorProtocol?
    
    var router: HistoryPresenterToRouterProtocol?
    
    
}
extension HistoryPresenter : HistoryInteractorToPresenterProtocol{
    func failedToConvertCSV() {
        view?.failedToConvertCSV()
    }
    
    func didConverToCSV(path: String) {
    view?.pathCSV(path: path)
    }
    
    
    
    
}
