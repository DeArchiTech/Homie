//
// Created by davix on 10/4/15.
// Copyright (c) 2015 Homie. All rights reserved.
//

import Foundation

class BackEndManager : BackEndProtocol{

    var endPoint: String {
        get {
            return ""
        }
        set {
        }
    }
    func login(loginForm: LoginForm) -> Int {
        return 200
    }

    func getUser(userID: Int) -> UserModel?{
        //TODO: Implement
        return nil
    }


}
