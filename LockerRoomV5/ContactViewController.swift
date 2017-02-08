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
    @IBOutlet weak var contactTableView: UITableView!

    var contacts : [Contacts] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        contactTableView.delegate = self
        contactTableView.dataSource = self
        
        FIRDatabase.database().reference().child("contacts").child("Departments").observe(FIRDataEventType.childAdded, with: { (snapshot) in
            let contact = Contacts()
            contact.departmentName = (snapshot.value as! NSDictionary)["name"] as! String
            
            
            self.contacts.append(contact)
            self.contactTableView.reloadData()
            
        })
        
        // Do any additional setup after loading the view.
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        let contact = contacts[indexPath.row]
        
        cell.textLabel?.text = contact.departmentName
        return cell
    }
    
    
}
