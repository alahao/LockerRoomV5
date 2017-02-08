//
//  RootMenuTableViewCell.swift
//  LockerRoomV5
//
//  Created by NANZI WANG on 2/7/17.
//  Copyright © 2017 NANZI WANG. All rights reserved.
//

import UIKit

class RootMenuTableViewCell: UITableViewCell {

    @IBOutlet weak var menuLabel: UILabel!
    @IBOutlet weak var iconImageView: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
