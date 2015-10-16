//
//  HomeOSViewController.swift
//  Homie
//
//  Created by davix on 10/12/15.
//  Copyright © 2015 Homie. All rights reserved.
//

import Foundation
import UIKit

class EventsViewController: UIViewController , UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var eventsTableView: UITableView!
    
    var textArray: NSMutableArray! = NSMutableArray()
    var tableTitle: String = "Local Events"
    
    override func viewDidLoad(){
        
        super.viewDidLoad()
        
        self.textArray.addObject("FirstEvent")
        self.textArray.addObject("SecondEvent")
        self.textArray.addObject("ThirdEvent")
        
        //register custom cell
        let nib = UINib(nibName: "EventItemCell", bundle: nil)
        self.eventsTableView.registerNib(nib, forCellReuseIdentifier: "cell")
        
        self.eventsTableView.rowHeight = UITableViewAutomaticDimension
        self.eventsTableView.estimatedRowHeight = 250.0
        
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
        
        let cell: UITableViewCell = self.eventsTableView.dequeueReusableCellWithIdentifier("cell") as UITableViewCell!
        
        var customCell : EventItemCell! = cell as? EventItemCell
        
        customCell.eventUIView.titleLabel?.text = self.textArray.objectAtIndex(indexPath.row) as? String
        
        return customCell
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return self.tableTitle
        
    }
}