//
//  NewsTableViewCell.swift
//  LockerRoomV5
//
//  Created by NANZI WANG on 2/6/17.
//  Copyright © 2017 NANZI WANG. All rights reserved.
//

import UIKit

class NewsTableViewCell: UITableViewCell {
    @IBOutlet weak var newsTitleLabel: UILabel!
  
    @IBOutlet weak var newsDateLabel: UILabel!
    @IBOutlet weak var newsImageView: UIImageView!
    @IBOutlet weak var newsBodyLabel: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
