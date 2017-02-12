//
//  newsDetailedViewController.swift
//  LockerRoomV5
//
//  Created by NANZI WANG on 2/11/17.
//  Copyright © 2017 NANZI WANG. All rights reserved.
//

import UIKit
import FirebaseStorage
import WebKit

class newsDetailedViewController: UIViewController, WKUIDelegate {
    @IBOutlet weak var newsDetailedTitle: UILabel!
    @IBOutlet weak var newsDetailedBody: UITextView!
    
    var newsArticle = NewsArticle()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        newsDetailedTitle.text = newsArticle.newsTitle
        newsDetailedBody.text = newsArticle.newsBody
    }

  
}
