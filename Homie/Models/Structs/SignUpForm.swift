//
//  SignUpForm.swift
//  Homie
//
//  Created by davix on 10/21/15.
//  Copyright © 2015 Homie. All rights reserved.
//

import Foundation

struct SignUpForm{
    
    var identifier : String
    var password : String
    
    init(identifier : String, password : String){
        
        self.identifier = identifier
        self.password = password
    }
    
}