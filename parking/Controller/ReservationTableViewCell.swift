//
//  ReservationTableViewCell.swift
//  parking
//
//  Created by Xueying Zou on 2022/5/19.
//

import Foundation
import UIKit

class ReservationTableViewCell: UITableViewCell {

    @IBOutlet weak var parkingPlaceLabel: UILabel!
    @IBOutlet weak var licensePlateLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
