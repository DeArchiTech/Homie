//
//  ItemViewModel.swift
//  Homie
//
//  Created by davix on 10/29/15.
//  Copyright © 2015 Homie. All rights reserved.
//

import Foundation

class DetailItemViewModel{

    var item : ItemModel
    var seller : UserModel
    var locationModel : LocationModel?
    var profileImage : String?
    
    init(item : ItemModel , seller : UserModel){
        
        self.item = item
        self.seller = seller
    }

    func getSellerProfileImageUrl() -> String{
    
        if let _ = self.profileImage {
        
            return self.profileImage!
        
        }else{
        
            self.profileImage = self.seller.image
            return self.profileImage!
            
        }
    
    }

    func getItemImageUrl() -> String{
    
        if let array = self.item.photos{
        
            if array.count > 0{
            
                return array.first!
            
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
    
        return self.item.itemName!
    
    }

    func getItemDescription() -> String{
    
        return self.item.description!
    
    }

    func getPickUpPrice() -> Double{
    
        return self.item.pickUpPrice!
    
    }

    func getDeliveryPrice() -> Double{
    
        return self.item.deliveryPrice!
    
    }

}