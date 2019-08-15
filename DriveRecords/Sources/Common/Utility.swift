//
//  Utility.swift
//  DriveRecords
//
//  Created by Hamza Khan on 07/08/2019.
//  Copyright © 2019 Hamza Khan. All rights reserved.
//

import Foundation

class Utility {
    static func formatDistanceValue(val : String) -> String{
        var distance = val
        if distance == ""{
            distance = "0.0"
        }
        return distance + " " + "KM"
    }
    static func convertIntToMonthString(month: Int) -> String{
        switch month {
        case 1:
            return "January"
        case 2:
            return "Feburary"
        case 3:
            return "March"
        case 4:
            return "April"
        case 5:
            return "May"
        case 6:
            return "June"
        case 7:
            return "July"
        case 8:
            return "August"
        case 9:
            return "September"
        case 10:
            return "October"
        case 11:
            return "November"
        case 12:
            return "December"
        default:
            return ""
        }
    }
}
