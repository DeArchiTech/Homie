//
// Created by davix on 10/5/15.
// Copyright (c) 2015 Homie. All rights reserved.
//

import Foundation
import SwiftyJSON

class MockBackEndManager : APIFetchingProtocol{

    var data: MockBackendData = MockBackendData()

    var delegate : NetworkOnCompleteCallBack?
    
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

    func getUser(userID: String) -> Bool{
        return false
    }
    
    func signUp(signUpForm : SignUpForm) -> Bool {
        
        //Todo: Implement
        return false
        
    }
    
    func getTrendingItems() -> Bool{
        
        //Todo: Implement
        return false
        
    }
    
    func getSearchResults(searchForm : SearchForm) -> Bool{
        
        //Todo: Implement
        return false
        
    }
    
    func postItem(item: ItemModel) -> Bool {
        
        //Todo: Implement
        return false
        
    }
    
    func postImage(image: UIImage)-> Bool {
        
        //Todo: Implement
        return false
        
    }
    
    func getUsers() -> Bool{
        
        //Todo: Implement
        return false
        
    }
    
    func setDelegate(delegate : NetworkOnCompleteCallBack){
        
        self.delegate = delegate
        
    }
    
}
