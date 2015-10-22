//
//  ParseManager.swift
//  Homie
//
//  Created by davix on 10/21/15.
//  Copyright © 2015 Homie. All rights reserved.
//

import Foundation
import SwiftyJSON

class ParseManager : BackEndProtocol{
    
    init(){
        
    }
    
    var endPoint: String {
        get {
            return ""
        }
        set {
        }
    }
    
    func login(loginForm : LoginForm) -> Int {
        
        //Todo: Implement
        return 0
        
    }
    
    func signUp(signUpForm : SignUpForm) -> Int {
        
        //Todo: Implement
        return 0
        
    }
    
    func getUser(userID : Int) -> UserModel? {
        
        //Todo: Implement
        return nil
        
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