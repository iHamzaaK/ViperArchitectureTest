//
//  HistoryViewController+TableViewDelegates.swift
//  DriveRecords
//
//  Created by Hamza Khan on 07/08/2019.
//  Copyright © 2019 Hamza Khan. All rights reserved.
//

import Foundation
import UIKit
extension HistoryViewController : UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let record = self.items[indexPath.section][indexPath.row]
        presenter?.goToHistoryDetail(record: record, navigationController: self.navigationController!)
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if self.tableView(tableView, numberOfRowsInSection: section) > 0 {
            return Utility.convertIntToMonthString(month: section+1)
            //
        }
        return ""
    }
}
