//
//  BackEndDataDelegate.swift
//  Homie
//
//  Created by davix on 10/27/15.
//  Copyright © 2015 Homie. All rights reserved.
//

import Foundation


protocol BackEndCallCompleteProtocol{

    func onNetworkSuccess(nsobject : NSObject) -> Void
    func onNetworkFailure(statusCode : Int , message : String) -> Void
    
}