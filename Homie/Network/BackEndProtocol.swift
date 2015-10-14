//
// Created by davix on 10/4/15.
// Copyright (c) 2015 Homie. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper

protocol BackEndProtocol{

    var endPoint: String { get set }
    func login(loginForm : LoginForm) -> Int
    func getUser(userID : Int) -> UserModel?

}
