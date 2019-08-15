//
//  OngoingViewController+UITextFieldDelegates.swift
//  DriveRecords
//
//  Created by Hamza Khan on 06/08/2019.
//  Copyright © 2019 Hamza Khan. All rights reserved.
//

import Foundation
import UIKit

extension OngoingViewController : UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
