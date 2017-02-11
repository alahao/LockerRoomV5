//
//  CalendarViewController.swift
//  LockerRoomV5
//
//  Created by NANZI WANG on 2/11/17.
//  Copyright © 2017 NANZI WANG. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class CalendarViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var menuButton: UIBarButtonItem!
    var calendarHolidays : [calendarHoliday] = []
    
    @IBOutlet weak var calendarTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        calendarTableView.delegate = self
        calendarTableView.dataSource = self
        
        FIRDatabase.database().reference().child("Calendar").observe(FIRDataEventType.childAdded, with: { (snapshot) in
            let holiday = calendarHoliday()
            holiday.date = (snapshot.value as! NSDictionary)["date"] as! String
            holiday.name = (snapshot.value as! NSDictionary)["name"] as! String
            
            self.calendarHolidays.append(holiday)
            self.calendarTableView.reloadData()
            
        })
        
        // Do any additional setup after loading the view.
        
        //Slide out menu
        if revealViewController() != nil{
            
            menuButton.target = revealViewController()
            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
            view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
    }
    
    
    // There is just one row in every section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return calendarHolidays.count
    }
    
    
    // Make the background color show through
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "calendarCell") as! CalendarTableViewCell
        
        let holiday = calendarHolidays[indexPath.row]
        
        cell.calendarName.text = holiday.name
        cell.calendarDate.text = holiday.date
     
        return cell
    }
    
    
}
