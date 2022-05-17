//
//  ParkingItemTableViewCell.swift
//  parking
//
//  Created by Fisch on 2022/5/15.
//

import UIKit

class ParkingItemTableViewCell: UITableViewCell {
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var address: UILabel!
    @IBOutlet weak var status: UILabel!
    @IBOutlet weak var total: UILabel!
    @IBOutlet weak var remain: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
