//
//  ItemModel.swift
//  Homie
//
//  Created by davix on 10/9/15.
//  Copyright © 2015 Homie. All rights reserved.
//

import Foundation

class ItemModel : DetailItemViewModel{
    
    var itemName: String?
    var description: String?
    var photos : [String]?
    var lattitude : Double?
    var longitute : Double?
    var pickUpPrice : Double?
    var deliveryPrice : Double?
    var seller : UserModel?
    var locationModel : LocationModel?
    var profileImage : String?
    
    func getSellerProfileImageUrl() -> String{
        
        if let _ = self.profileImage {
            
            return self.profileImage!
            
        }else{
            
            if let _ = self.seller{
                
                self.profileImage = self.seller?.image
                return self.profileImage!
                
            }else{
        
                return ""

            }
            
        }
        
    }
    
    func getItemImageUrl() -> String{

        if let array = self.photos{
            
            if array.count > 0{
            
                return self.photos!.first!
                
            }
            
        }
        
        return ""
        
    }
    
    func getDistrictName() -> String{
        
        if let model = self.locationModel {
            
            return model.getDistrictName()
            
        }else {
            
            return "No District"
        }
        
    }
    
    func getItemName() -> String{
        
        return self.itemName!
        
    }
    
    func getItemDescription() -> String{
    
        return self.description!
        
    }
    
    func getPickUpPrice() -> Double{
        
        return self.pickUpPrice!
        
    }
    
    func getDeliveryPrice() -> Double{
        
        return self.deliveryPrice!
        
    }
}