//
//  UserInfo.swift
//  Homie
//
//  Created by davix on 10/5/15.
//  Copyright © 2015 Homie. All rights reserved.
//

import Foundation
import ObjectMapper

struct UserInfo : Mappable{
    
    var userID : Int?
    var identifier : String?

    init?(_ map: Map) {
    }

    mutating func mapping(map: Map) {
        userID <- map["userID"]
        identifier <- map["identifier"]
    }
    
}