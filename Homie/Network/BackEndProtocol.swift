//
// Created by davix on 10/4/15.
// Copyright (c) 2015 Homie. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper
import SwiftyJSON

protocol BackEndProtocol{

    var endPoint: String { get set }
    
    func login(loginForm : LoginForm) -> Int
    func signUp(signUpForm : SignUpForm) -> Int
    
    func getUser(userID : Int) -> UserModel?
    func getTrendingItems() -> [ItemModel]?
    func getSearchResults(jsonObject : JSON) ->[ItemModel]?
    func postItem(item: ItemModel) -> Int
    func postImage(image: UIImage)-> Int
    
}
