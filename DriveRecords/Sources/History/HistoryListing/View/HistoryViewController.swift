//
//  HistoryViewController.swift
//  DriveRecords
//
//  Created by Hamza Khan on 05/08/2019.
//  Copyright © 2019 Hamza Khan. All rights reserved.
//

import UIKit

class HistoryViewController: UIViewController {

    var presenter : HistoryViewToPresenterProtocol?
    var items: [[RideRecord]] = []

    // MARK: - Constants
    let navigationTitle = "History List"
    let cellIdentifier = "historyCell"
 
    
    @IBOutlet var tblView : UITableView! {
        didSet{
            tblView.delegate = self
            tblView.dataSource = self
            let nib = UINib(nibName: "HistoryCell", bundle: Bundle.main)
            tblView.register(nib, forCellReuseIdentifier: "historyCell")
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewHasLoaded(navItem : navigationItem)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.title = "History"
    }
}

extension HistoryViewController: HistoryPresenterToViewProtocol{
    func failedToConvertCSV() {
        
    }
    
    func pathCSV(path: String) {
        displaySharingActivity(csvPath: path)
    }
    func displaySharingActivity(csvPath : String){
        let firstActivityItem = URL(fileURLWithPath: csvPath)
        let activityController = UIActivityViewController(activityItems: [firstActivityItem], applicationActivities: nil)
        activityController.excludedActivityTypes  = [
            .assignToContact,
            .saveToCameraRoll,
            .print,
            .postToVimeo,
            .postToWeibo,
            .postToFlickr,
            .postToTwitter,
            .postToFacebook,
            .postToTencentWeibo,
        ]
        self.present(activityController, animated: true, completion: nil)
    }
    
}


