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
    var arrayTitle: String = "Buy and sell items"
    
    //Hold Sellers and Items
    
    var sellers : [UserModel]?
    var items : [ItemModel]?
    
    override func viewDidLoad(){
        
        super.viewDidLoad()
        
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = 88.0
        
        //register custom cell
        let nib = UINib(nibName: "MarketItemCell", bundle: nil)
        self.tableView.registerNib(nib, forCellReuseIdentifier: "marketItemCell")
        
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.rowHeight = 380.0
    
    }
    
    override func didReceiveMemoryWarning() {
        
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    
        return 1
    
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return (self.items?.count)!
    
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell: UITableViewCell = self.tableView.dequeueReusableCellWithIdentifier("marketItemCell") as UITableViewCell!
        
        let customCell : MarketItemCell! = cell as? MarketItemCell
        
        return customCell
        
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return self.arrayTitle
        
    }
    
    func loadItemCell(customCell : MarketItemCell , itemViewModel : DetailItemViewModel) -> Bool{
        
        customCell.titleLabel.text = itemViewModel.getItemName()
        customCell.descriptionLabel.text = itemViewModel.getItemDescription()
        customCell.pickUpPrice.text = String(itemViewModel.getPickUpPrice())
        customCell.deliveryPrice.text = String(itemViewModel.getDeliveryPrice())
        return true
        
    }
    
    func createItemViewModel(index : Int) -> DetailItemViewModel?{
        
        if index < self.items?.count {
            
            let seller = self.sellers![index]
            let item = self.items![index]
            return DetailItemViewModel(item: item, seller: seller)
        
        }
        return nil
    }
    
}