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
    
    func getDeliveryLowerRange() -> Double{
        
        return 0.0
        
    }
    
    func getDeliveryUpperRange() -> Double{
        
        return 0.0
        
    }
    
    func getPickupLowerRange() -> Double{
        
        return 0.0
        
    }
    
    func getPickUpUpperRange() -> Double{
        
        return 0.0
        
    }
}