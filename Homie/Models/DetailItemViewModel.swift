//
//  ItemViewModel.swift
//  Homie
//
//  Created by davix on 10/29/15.
//  Copyright © 2015 Homie. All rights reserved.
//

import Foundation

protocol DetailItemViewModel{
    
    func getSellerProfileImage() -> String
    
    func getItemImage() -> String
    
    func getDistrictName() -> String
    
    func getItemName() -> String
    
    func getItemDescription() -> String
    
    func getPickUpPrice() -> String
    
    func getDeliveryPrice() -> String

}