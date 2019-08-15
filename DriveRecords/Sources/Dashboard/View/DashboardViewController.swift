//
//  DashboardViewController.swift
//  DriveRecords
//
//  Created by Hamza Khan on 05/08/2019.
//  Copyright © 2019 Hamza Khan. All rights reserved.
//

import UIKit

class DashboardViewController: UIViewController {
    
    var presenter : DashboardViewToPresenterProtocol?
    
    // MARK: - IBOUTLETS
    @IBOutlet weak var btnStart : UIButton!
    @IBOutlet weak var btnHistory : UIButton!
    @IBOutlet weak var lblCurrentMonthTitle : UILabel!
    @IBOutlet weak var lblCurrentMonthDistance : UILabel!
    @IBOutlet weak var lblTotalDistance : UILabel!
    var rideRecords : [[RideRecord]] = [[RideRecord]]()
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.title = "Dashboard"
        presenter?.viewHasLoaded()

    }
  
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension DashboardViewController {
    @IBAction func didTapOnStartBtn(_ sender: Any) {
        presenter?.startRide(navigationController: navigationController!)
    }
    @IBAction func didTapOnHistoryBtn(_ sender: Any) {
        presenter?.goToHistory(records: rideRecords, navigationController: navigationController!)
    }
}


extension DashboardViewController : DashboardPresenterToViewProtocol{
    func getDistances(currentMonthDistance: String, totalDistance: String, month: String) {
        lblCurrentMonthDistance.text = currentMonthDistance
        lblTotalDistance.text = totalDistance
        lblCurrentMonthTitle.text = "Distance Covered in \(month):"
    }
    

    
    func didRetrieveRecords(records: [[RideRecord]]) {
        rideRecords = records
    }
    
 
    
    
}
