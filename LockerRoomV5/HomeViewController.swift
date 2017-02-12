//
//  HomeViewController.swift
//  LockerRoomV5
//
//  Created by NANZI WANG on 1/29/17.
//  Copyright © 2017 NANZI WANG. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class HomeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
 
    @IBOutlet weak var menuButton: UIBarButtonItem!
    @IBOutlet weak var newsTableView: UITableView!
    
    var newsArticles : [NewsArticle] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        newsTableView.delegate = self
        newsTableView.dataSource = self
        
        // Do any additional setup after loading the view.
        
        FIRDatabase.database().reference().child("news").observe(FIRDataEventType.childAdded, with: { (snapshot) in
            let newsArticle = NewsArticle()
            newsArticle.newsBody = (snapshot.value as! NSDictionary)["body"] as! String
            newsArticle.newsTitle = (snapshot.value as! NSDictionary)["title"] as! String
            newsArticle.newsDate = (snapshot.value as! NSDictionary)["date"] as! String
            
            self.newsArticles.append(newsArticle)
            self.newsTableView.reloadData()
        })
 
        // Slide out menu
        if revealViewController() != nil {
        
            menuButton.target = revealViewController()
            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
            view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
            view.addGestureRecognizer(self.revealViewController().tapGestureRecognizer())
        }
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
        print("Sendit \(news)")
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let newsArticle = newsArticles[indexPath.row]
        performSegue(withIdentifier: "viewNewsDetailedSegue", sender: newsArticle)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "viewNewsDetailedSegue" {
        let nextVC = segue.destination as! newsDetailedViewController
        nextVC.newsArticle = sender as! NewsArticle
        }
    }
 }
