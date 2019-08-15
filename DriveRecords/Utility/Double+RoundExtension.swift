//
//  Double+RoundExtension.swift
//  DriveRecords
//
//  Created by Hamza Khan on 05/08/2019.
//  Copyright © 2019 Hamza Khan. All rights reserved.
//

import Foundation

extension Double{
    func roundTo(places: Int) -> Double {
            let divisor = pow(10.0, Double(places))
            return (self * divisor).rounded() / divisor
    }
    
    func toString()->String{
        return String(self)
    }
}
