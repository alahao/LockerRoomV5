//
//  HomeViewController.swift
//  LockerRoomV5
//
//  Created by NANZI WANG on 1/29/17.
//  Copyright © 2017 NANZI WANG. All rights reserved.
//

import UIKit
import SideMenu
import Firebase
import FirebaseDatabase


class HomeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
 
    @IBOutlet weak var newsTableView: UITableView!
    
    var newsArticles : [NewsArticle] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        newsTableView.delegate = self
        newsTableView.dataSource = self
        
        FIRDatabase.database().reference().child("news").observe(FIRDataEventType.childAdded, with: { (snapshot) in
            let newsArticle = NewsArticle()
            newsArticle.newsBody = (snapshot.value as! NSDictionary)["body"] as! String
            newsArticle.newsTitle = (snapshot.value as! NSDictionary)["title"] as! String
            newsArticle.newsDate = (snapshot.value as! NSDictionary)["date"] as! String
            
            self.newsArticles.append(newsArticle)
            self.newsTableView.reloadData()
            
            
            //assuming we already have our navigationController
            let navigationBar = UINavigationBar()
            let myNicelLogoWidth = 50
            let myNiceLogoHeight = 20
            //start positioning your logo at 0.0, 0.0
            let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: myNicelLogoWidth, height: myNiceLogoHeight))
            imageView.contentMode = .scaleAspectFit
            imageView.center = navigationBar.center //the put your image at the center
            
            let image = UIImage(named: "LOCKERROOM_MAIN_HEADER_03")
            imageView.image = image
            
            
            self.navigationItem.titleView = imageView
       
        })
       
        // Do any additional setup after loading the view.
        
    }
    
 
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsArticles.count
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 10 // space b/w cells
    }
    
    // Make the background color show through
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerView = UIView()
        footerView.backgroundColor = UIColor.clear
        return footerView
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "newsCell") as! NewsTableViewCell
        
        let news = newsArticles[indexPath.row]
        
        cell.newsTitleLabel.text = news.newsTitle
        cell.newsBodyLabel.text = news.newsBody
        cell.newsDateLabel.text = news.newsDate
        
        cell.layer.borderWidth = 1.0
        cell.layer.borderColor = UIColor.lightGray.cgColor
        cell.layer.cornerRadius = 8
        
        return cell
    }

       
 }
