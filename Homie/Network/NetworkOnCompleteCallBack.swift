//
//  ParseOnCompleteProtocol.swift
//  Homie
//
//  Created by davix on 11/5/15.
//  Copyright © 2015 Homie. All rights reserved.
//

import Foundation

protocol NetworkOnCompleteCallBack{
    
    func onNetworkSuccess(nsobject : NSObject) -> Void
    func onNetworkFailure(statusCode : Int , message : String) -> Void
    
}