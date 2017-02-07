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
       
        })
       
        // Do any additional setup after loading the view.
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsArticles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "newsCell") as! NewsTableViewCell
        
        let news = newsArticles[indexPath.row]
        
        cell.newsTitleLabel.text = news.newsTitle
        cell.newsBodyLabel.text = news.newsBody
        cell.newsDateLabel.text = news.newsDate
        return cell
    }

       
 }
