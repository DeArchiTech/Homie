//
// Created by davix on 10/5/15.
// Copyright (c) 2015 Homie. All rights reserved.
//

import Foundation
import SwiftyJSON

class MockBackEndManager : BackEndProtocol {

    var data: MockBackendData = MockBackendData()

    init(){

    }

    var endPoint: String {
        get {
            return "http://www.dummieApiEndPoint.com"
        }
        set {
        }
    }

    func login(loginForm: LoginForm) -> Bool{
        return true
    }

    func getUser(userID: Int) -> UserModel?{
        return self.data.getUser()
    }
    
    func signUp(signUpForm : SignUpForm) -> Bool {
        
        //Todo: Implement
        return true
        
    }
    
    func getTrendingItems() -> [ItemModel]?{
        
        //Todo: Implement
        return nil
        
    }
    
    func getSearchResults(jsonObject : JSON) ->[ItemModel]?{
        
        //Todo: Implement
        return nil
        
    }
    
    func postItem(item: ItemModel) -> Int {
        
        //Todo: Implement
        return 0
        
    }
    
    func postImage(image: UIImage)-> Int {
        
        //Todo: Implement
        return 0
        
    }
}
