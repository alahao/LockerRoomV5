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
            print("Title of the news is \(newsArticle.newsTitle)")
            print("Body of the news is \(newsArticle.newsBody)")
            
            self.newsArticles.append(newsArticle)
            self.newsTableView.reloadData()
       
        })
       
        // Do any additional setup after loading the view.
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsArticles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        let news = newsArticles[indexPath.row]
        
        cell.textLabel?.text = news.newsTitle
        return cell
    }

       
 }
