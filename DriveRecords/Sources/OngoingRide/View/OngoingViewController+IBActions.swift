//
//  OngoingViewController+IBActions.swift
//  DriveRecords
//
//  Created by Hamza Khan on 06/08/2019.
//  Copyright © 2019 Hamza Khan. All rights reserved.
//

import Foundation
import UIKit
extension OngoingViewController {
    @IBAction func didTapOnEnd(_ sender: Any) {
        presenter?.saveRecord(passengerName: (txtName.text ?? ""))
    }
}
