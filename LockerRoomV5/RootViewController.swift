//
//  RootViewController.swift
//  LockerRoomV5
//
//  Created by NANZI WANG on 1/28/17.
//  Copyright © 2017 NANZI WANG. All rights reserved.
//

import UIKit

class RootViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var menuTableView: UITableView!
 
    
    let menuNameArr = ["HOME","CONTACTS","RESOURCES & TOOLS","NEW HIRES","MANAGER'S CORNER","EMPLOYEE FAQ","CALENDAR","RSN SPECIFIC","TIMEKEEPER","SELF-SERVICE PORTOAL","FEEDBACK CHAT"]
    let iconImage = [UIImage(named:"ICON_RSN")!,UIImage(named:"ICON_CTS")!,UIImage(named: "ICON_RESOURCES")!,UIImage(named: "ICON_NEWHIRE")!,UIImage(named: "ICON_MANAGER")!,UIImage(named: "ICON_FAQ")!,UIImage(named: "ICON_CALENDAR")!,UIImage(named: "ICON_RSN")!,UIImage(named: "ICON_TIMEKEEPER")!,UIImage(named: "ICON_SELFSERVICE")!,UIImage(named: "ICON_CHAT")!]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        menuTableView.delegate = self
        menuTableView.dataSource = self
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuNameArr.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "menuCell") as! RootMenuTableViewCell

        cell.iconImageView.image = iconImage[indexPath.row]
        cell.menuLabel.text = menuNameArr[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let menuName = menuNameArr[indexPath.row]
        performSegue(withIdentifier: menuName, sender: menuName)
    }



}

