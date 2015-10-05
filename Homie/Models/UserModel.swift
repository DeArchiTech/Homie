//
//  UserModel.swift
//  Homie
//
//  Created by davix on 10/4/15.
//  Copyright © 2015 Homie. All rights reserved.
//

import Foundation
import ObjectMapper

class UserModel : Mappable{

    var userID : Int?
    var identifier : String?
    
    init(){
        
    }

    required init?(_ map: Map) {
    }

    func mapping(map: Map) {
        self.userID <- map["userID"]
        self.identifier <- map["identifier"]
    }


}