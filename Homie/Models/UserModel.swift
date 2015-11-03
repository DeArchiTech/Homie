//
//  UserModel.swift
//  Homie
//
//  Created by davix on 10/4/15.
//  Copyright © 2015 Homie. All rights reserved.
//

import Foundation
import ObjectMapper

class UserModel{

    var userInfo : UserInfo
    var image : String?
    
    init(userInfo : UserInfo , image : String){
        
        self.userInfo = userInfo
        self.image = image
        
    }
    
    func getProfilePicture() -> String{
        
        if let _ = self.image{
            
            let result :String = self.image!
            return result
            
        }else{
            
            return ""
        
        }
        
    }

}