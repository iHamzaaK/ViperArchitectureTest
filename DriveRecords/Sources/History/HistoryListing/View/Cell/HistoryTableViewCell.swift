//
//  HistoryTableViewCell.swift
//  DriveRecords
//
//  Created by Hamza Khan on 07/08/2019.
//  Copyright © 2019 Hamza Khan. All rights reserved.
//

import UIKit

class HistoryTableViewCell: UITableViewCell {

    @IBOutlet weak var lblDate : UILabel!
    @IBOutlet weak var lblDistance : UILabel!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configCell(record : RideRecord){
        self.lblDate?.text = record.date?.toString()
        self.lblDistance?.text = Utility.formatDistanceValue(val: record.distance ?? "0.0")
    }

}
