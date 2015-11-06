//
//  File.swift
//  Homie
//
//  Created by davix on 10/12/15.
//  Copyright © 2015 Homie. All rights reserved.
//

import Foundation
import UIKit

class MarketViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, APIonCompleteProtocol{
    
    @IBOutlet weak var tableView: UITableView!
    
    var arrayTitle: String = "Buy and sell items"
    var detailItemViewModels = [DetailItemViewModel]()
    var apiManager : APIManager = APIManager()
    
    var developmentMode: Bool = true
    
    override func viewDidLoad(){
        
        super.viewDidLoad()
        self.apiManager = APIManager()
        if let _ = self.getData(SearchForm()){
            
            self.loadTable(self.getData(SearchForm())!)
        
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    
        return 1
    
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return self.detailItemViewModels.count

    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell: UITableViewCell = self.tableView.dequeueReusableCellWithIdentifier("marketItemCell") as UITableViewCell!
        
        let customCell : MarketItemCell! = cell as? MarketItemCell
        
        if self.detailItemViewModels.count > 0{
        
            let currentRow : Int = indexPath.row
        
            let model : DetailItemViewModel =  self.detailItemViewModels[currentRow]
    
            self.loadItemCell(customCell, itemViewModel: model)
            
        }
        
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
    
    func getData(form: SearchForm?) -> [DetailItemViewModel]?{
        
        if self.searchFormPassesValidation(form!){
            
            return self.apiManager.getSearchResults(form!, onComplete: self)
            
        }else{
            
            //Alert User that input is invalid
            presentViewController(
                AlertHelper().createAlertController("Search Form Validation", success : false), animated: true, completion: nil)
            return nil
            
        }
    }
    
    func searchFormPassesValidation(form : SearchForm) -> Bool{
        
        //return true for now, add validation later
        return true
        
    }
    
    func loadTable(items : [DetailItemViewModel]){
        
        //Assign Variables
        self.detailItemViewModels = items
        
        //Customize the nib
        let nib = UINib(nibName: "MarketItemCell", bundle: nil)
        self.tableView.registerNib(nib, forCellReuseIdentifier: "marketItemCell")
        self.tableView.rowHeight = 380.0
        
        //reload Data
        self.tableView.reloadData()
    }
    
    
    //NETWORK TRIGGERD FUNCTIONS
    
    func onNetworkSuccess(nsobject : NSObject){
        
        if(!developmentMode){
            presentViewController(AlertHelper().createAlertController("Network Request", success : true)
                , animated: true, completion: nil)
        }
        //Cast the Object back to DetailItemViewModel Array
        let array = (nsobject as! NSArray) as! [DetailItemViewModel]
        self.loadTable(array)
        
    }
    
    func onNetworkFailure(statusCode : Int , message : String){
        
        //Alert User that input is invalid
        presentViewController(
            AlertHelper().createAlertController("Network Request", success : false), animated: true, completion: nil)
        
    }
    
}