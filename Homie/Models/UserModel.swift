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
    
    init(userInfo : UserInfo){
        self.userInfo = userInfo
    }
}