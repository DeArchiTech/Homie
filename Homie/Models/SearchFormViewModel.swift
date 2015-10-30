//
//  SearchFormViewModel.swift
//  Homie
//
//  Created by davix on 10/28/15.
//  Copyright © 2015 Homie. All rights reserved.
//

import Foundation

class SearchFormViewModel{
    
    var searchForm : SearchForm
    
    init(searchForm : SearchForm){
        self.searchForm = searchForm
    }
    
    func getDeliveryLowerBound() -> Double{
        
        var bound : String? = self.searchForm.deliveryPriceRangeLow
        
        if bound == nil || bound! == ""{
            
            return 0.0
            
        }else{
            
            return (bound! as NSString).doubleValue
        }
        
    }
    
    func getDeliveryUpperBound() -> Double{
        
        var bound : String? = self.searchForm.deliveryPriceRangeHigh
        
        if bound == nil || bound! == ""{
            
            return 0.0
            
        }else{
            
            return (bound! as NSString).doubleValue
        }
        
    }
    
    func getPickupLowerBound() -> Double{
        
        var bound : String? = self.searchForm.pickUpPriceRangeLow
        
        if bound == nil || bound! == ""{
            
            return 0.0
            
        }else{
            
            return (bound! as NSString).doubleValue
        }
        
    }
    
    func getPickUpUpperBound() -> Double{
        
        var bound : String? = self.searchForm.pickUpPriceRangeHigh
        
        if bound == nil || bound! == ""{
            
            return 0.0
            
        }else{
            
            return (bound! as NSString).doubleValue
        }
        
    }
}