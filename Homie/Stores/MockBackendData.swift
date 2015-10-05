//
// Created by davix on 10/5/15.
// Copyright (c) 2015 Homie. All rights reserved.
//

import Foundation
import SwiftyJSON

class MockBackendData {

    var user : UserModel?

    init(){

        let path : String = NSBundle.mainBundle().pathForResource("MockJson" , ofType: "json") as String!
        let jsonData = NSData(contentsOfFile: path) as NSData!
        let readableJSON = JSON(data: jsonData, options: NSJSONReadingOptions.MutableContainers, error: nil)
        initUser(readableJSON);

    }

    func initUser(json : JSON){

    }

    func getUser() -> UserModel{
        return self.user!
    }

}
