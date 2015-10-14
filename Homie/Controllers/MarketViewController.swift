//
//  File.swift
//  Homie
//
//  Created by davix on 10/12/15.
//  Copyright © 2015 Homie. All rights reserved.
//

import Foundation
import UIKit

class MarketViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var textArray: NSMutableArray! = NSMutableArray()
    var arrayTitle: String = "Buy and sell items"
    
    override func viewDidLoad(){
        
        super.viewDidLoad()
        
        self.textArray.addObject("FirstItem")
        self.textArray.addObject("SecondItem")
        self.textArray.addObject("ThirdItem")
        
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = 44.0
        
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
        
        let cell: UITableViewCell = self.tableView.dequeueReusableCellWithIdentifier("cell") as UITableViewCell!
        
        cell.textLabel?.text = self.textArray.objectAtIndex(indexPath.row) as? String
        
        return cell
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return self.arrayTitle
        
    }
    
}