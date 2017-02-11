//
//  CalendarTableViewCell.swift
//  LockerRoomV5
//
//  Created by NANZI WANG on 2/11/17.
//  Copyright © 2017 NANZI WANG. All rights reserved.
//

import UIKit

class CalendarTableViewCell: UITableViewCell {

    @IBOutlet weak var calendarName: UILabel!
    @IBOutlet weak var calendarDate: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
