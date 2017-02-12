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
   
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var newsDetailedBody: UILabel!
    
    var newsArticle = NewsArticle()

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
       
        
        let myURL = URL(string: newsArticle.newsBody)
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
        
    }

  
}
