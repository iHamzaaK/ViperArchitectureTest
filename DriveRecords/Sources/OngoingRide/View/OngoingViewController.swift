//
//  OngoingViewController.swift
//  DriveRecords
//
//  Created by Hamza Khan on 05/08/2019.
//  Copyright © 2019 Hamza Khan. All rights reserved.
//

import UIKit


class OngoingViewController: UIViewController {
    // MARK: - Variables
    var presenter : OngoingViewToPresenterProtocol?
    var currentDate : Date = Date()
    // MARK:- IBOUTLETS
    @IBOutlet weak var lblTimer : UILabel!
    @IBOutlet weak var lblDistance : UILabel!
    @IBOutlet weak var txtName : UITextField!
    @IBOutlet weak var txtEmail : UITextField!
    @IBOutlet weak var txtCPR : UITextField!
    @IBOutlet weak var txtAdddress: UITextField!
    @IBOutlet weak var txtPhoneNumber : UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewHasLoaded()
        // Do any additional setup after loading the view.
        
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
        presenter?.viewDidDisappear()

    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.title = "Trip"
    }

}
extension OngoingViewController: OngoingPresenterToViewProtocol{
    func didSaveRecord() {
        self.navigationController?.popViewController(animated: true)
    }
    
    func getDistanceTravelled(value: String) {
        lblDistance.text = value
    }
    
    func getTimerValue(value: String) {
        lblTimer.text = value
        
    }
    
    
}
