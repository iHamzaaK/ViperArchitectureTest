//
//  HistoryViewController+TableViewDataSource.swift
//  DriveRecords
//
//  Created by Hamza Khan on 07/08/2019.
//  Copyright © 2019 Hamza Khan. All rights reserved.
//

import Foundation
import UIKit

extension HistoryViewController: UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return items.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! HistoryTableViewCell
        let item = self.items[indexPath.section][indexPath.row]
        
        cell.configCell(record: item)
        return cell
    }
}
