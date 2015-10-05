//
// Created by davix on 10/5/15.
// Copyright (c) 2015 Homie. All rights reserved.
//

import Foundation

class MockBackEndManager : BackEndProtocol {

    var endPoint: String {
        get {
            return "http://www.dummieApiEndPoint.com"
        }
        set {
        }
    }

    func login(loginForm: LoginForm) -> Alamofire.Request.response.statusCode {
        return 200
    }

    func getUser(userID: Int) -> UserModel {
        return nil
    }

}
