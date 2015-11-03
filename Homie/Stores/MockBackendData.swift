//
// Created by davix on 10/5/15.
// Copyright (c) 2015 Homie. All rights reserved.
//

import Foundation
import ObjectMapper

class MockBackendData {

    var user: UserModel?

    init() {

        initUser()

    }

    func initUser() {

        let path: String = NSBundle.mainBundle().pathForResource("UserModelJson", ofType: "json") as String!
        let data = NSData(contentsOfFile: path) as NSData!

        do {
            
            let JSONObject: AnyObject? = try NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers)
            let userInfo = Mapper<UserInfo>().map(JSONObject)
            self.user = UserModel(userInfo : userInfo! , image : "ABCD")
        
        }catch{
            
            print(error)
        
        }
        print(getUser().userInfo.userID)
        print(getUser().userInfo.identifier)
        
    }

    func getUser() -> UserModel {
        return self.user!    }

}
