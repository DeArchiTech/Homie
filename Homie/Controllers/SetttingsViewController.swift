//
//  SetttingsController.swift
//  Homie
//
//  Created by davix on 10/13/15.
//  Copyright © 2015 Homie. All rights reserved.
//

import Foundation
import UIKit

class SettingsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var contentTableView: UITableView!
    @IBOutlet weak var versionCodeUILabel: UILabel!
    @IBOutlet weak var statusUILabel: UILabel!
    
    var textArray: NSMutableArray! = NSMutableArray()
    var arrayTitle: String = "Buy and sell items"
    @IBOutlet weak var profileImageView: UIImageView!
    var defaultSettings: Bool = true
    
    override func viewDidLoad(){
        
        super.viewDidLoad()
        if defaultSettings {
        
           // loadDefaultValues()
            
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
        
        let cell: UITableViewCell = self.contentTableView.dequeueReusableCellWithIdentifier("cell") as UITableViewCell!
        
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
        
        self.contentTableView.rowHeight = UITableViewAutomaticDimension
        self.contentTableView.estimatedRowHeight = 44.0
        
        //Initialize the images
        
        let image = UIImage(named: "profileImagePlaceHolder")
        self.profileImageView.image = image
        
        //Initialize the text
        
        self.statusUILabel.text = "\"I only want to live once\" - Taylor Swift"
        self.versionCodeUILabel.text = "\"Homie v-1.0"
        
    }
    
    /*
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    
        return ""
        
    }
    */
    
}