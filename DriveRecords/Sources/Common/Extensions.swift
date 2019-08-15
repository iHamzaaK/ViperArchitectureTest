//
//  Extensions.swift
//  DriveRecords
//
//  Created by Hamza Khan on 07/08/2019.
//  Copyright © 2019 Hamza Khan. All rights reserved.
//

import Foundation

extension Date{
    func toString() -> String {
        let dateFormatter:DateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy HH:mm"
        let dateString: String = dateFormatter.string(from: self)
        return dateString
    }
    var month: Int {
        return Calendar.current.component(.month, from: self)
    }
}

extension String{
    func toInt()-> Int{
        return (Int(self) ?? 0)
    }
    func toDouble()-> Double{
        return (Double(self) ?? 0.0)

    }
}

extension Int{
    func toString()-> String{
        return String(self)
    }
}


