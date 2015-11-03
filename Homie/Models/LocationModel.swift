//
//  LocationModel.swift
//  Homie
//
//  Created by davix on 10/30/15.
//  Copyright © 2015 Homie. All rights reserved.
//

import Foundation

class LocationModel{
    
    var districtName : String

    init(districtName : String){
        
        self.districtName = districtName
    }
    
    func getDistrictName() -> String {
        
        return self.districtName
        
    }
    
}