//
//  SetttingsController.swift
//  Homie
//
//  Created by davix on 10/13/15.
//  Copyright © 2015 Homie. All rights reserved.
//

import Foundation
import UIKit

class SettingsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var profileUIImageView: UIImageView!
    @IBOutlet weak var statusUILabel: UILabel!
    @IBOutlet weak var userNameUILabel: UILabel!
    @IBOutlet weak var settingsItemTable: UITableView!
    @IBOutlet weak var versionCodeUILabel: UILabel!
    
    var textArray: NSMutableArray! = NSMutableArray()
    var arrayTitle: String = "User setting"
    var defaultSettings: Bool = true
    
    override func viewDidLoad(){
        
        super.viewDidLoad()
        if defaultSettings {
        
            loadDefaultValues()
            
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 1
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.textArray.count
        
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell: UITableViewCell = self.settingsItemTable.dequeueReusableCellWithIdentifier("cell") as UITableViewCell!
        
        cell.textLabel?.text = self.textArray.objectAtIndex(indexPath.row) as? String
        
        return cell
    }
    
    func loadDefaultValues(){
        
        //Initialize the table
        
        self.textArray.addObject("Name")
        self.textArray.addObject("Status")
        self.textArray.addObject("Profile")
        self.textArray.addObject("Homie ID")
        self.textArray.addObject("Push Notification")
        
        
        self.settingsItemTable.rowHeight = UITableViewAutomaticDimension
        self.settingsItemTable.estimatedRowHeight = 44.0
        
        //Initialize the images
        
        let image = UIImage(named: "profileImagePlaceHolder")
        self.profileUIImageView.image = image
        
        //Initialize the text
        
        self.statusUILabel.text = "\"I only want to live once\""
        self.userNameUILabel.text = "-Taylor Swift"
        self.versionCodeUILabel.text = "Homie v-1.0"
        
    }
    
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    
        return ""
        
    }
    
    
}