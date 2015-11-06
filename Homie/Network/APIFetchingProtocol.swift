//
// Created by davix on 10/4/15.
// Copyright (c) 2015 Homie. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper
import SwiftyJSON

protocol APIFetchingProtocol{

    var endPoint: String { get set }
    
    func login(loginForm : LoginForm) -> Bool
    func signUp(signUpForm : SignUpForm) -> Bool
    
    func getUser(userID : String) -> Bool
    func getTrendingItems() -> Bool
    func getSearchResults(searchForm : SearchForm) -> Bool
    func postItem(item: ItemModel) -> Bool
    func postImage(image: UIImage)-> Bool
    func getUsers() -> Bool
    func setDelegate(delegate : NetworkOnCompleteCallBack)
    
}
