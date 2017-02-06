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
 
    
    let menuNameArr = ["HOME","CONTACTS","RESOURCES & TOOLS","NEW HIRES","MANAGER'S CORNER"]
    let iconImage = [UIImage(named:"ICON_CTS")!,UIImage(named:"ICON_CTS")!,UIImage(named: "ICON_RESOURCES")!,UIImage(named: "ICON_NEWHIRE")!,UIImage(named: "ICON_MANAGER")!]
    

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
        let cell = UITableViewCell()

        cell.imageView?.image = iconImage[indexPath.row]
        cell.textLabel?.text = menuNameArr[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let menuName = menuNameArr[indexPath.row]
        performSegue(withIdentifier: menuName, sender: menuName)
    }



}

