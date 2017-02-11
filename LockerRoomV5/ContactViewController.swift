//
//  ContactViewController.swift
//  LockerRoomV5
//
//  Created by NANZI WANG on 2/4/17.
//  Copyright © 2017 NANZI WANG. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class ContactViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var menuButton: UIBarButtonItem!
    @IBOutlet weak var contactTableView: UITableView!

    var contacts : [ContactsCat] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        contactTableView.delegate = self
        contactTableView.dataSource = self
        
        FIRDatabase.database().reference().child("contacts").child("Departments").observe(FIRDataEventType.childAdded, with: { (snapshot) in
            let contact = ContactsCat()
            contact.departmentName = (snapshot.value as! NSDictionary)["name"] as! String
            
            
            self.contacts.append(contact)
            self.contactTableView.reloadData()
            
        })
        
        // Do any additional setup after loading the view.
        //Slide out menu
        if revealViewController() != nil{
            
            menuButton.target = revealViewController()
            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
            view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        let contactCat = contacts[indexPath.row]
        
        print(contacts.count)
        print(contacts[indexPath.row])
        
        cell.textLabel!.text = contactCat.departmentName
        
        tableView.layer.masksToBounds = true
        tableView.layer.borderColor = UIColor.lightGray.cgColor
        tableView.layer.borderWidth = 2.0
        tableView.layer.cornerRadius = 10.0
        return cell
    }
    
    
}
