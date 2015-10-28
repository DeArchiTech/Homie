//
//  ParseManager.swift
//  Homie
//
//  Created by davix on 10/21/15.
//  Copyright © 2015 Homie. All rights reserved.
//

import Foundation
import SwiftyJSON
import Parse

//Treat each Network call as with signals, one that sends to server, one that recieves from server
//Test each network call's signals individually
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
    
    func login(loginForm : LoginForm) -> Bool {
        
        //1)Login user with parse SDK
        PFUser.logInWithUsernameInBackground(loginForm.identifier, password: loginForm.password,
            block:{(loggedInuser: PFUser?, signupError: NSError?) -> Void in
            if loggedInuser != nil {

                //FIRE SUCCESS DELEGATE
                
            }else {

                //FIRE FAILURE DELEGATE
            }
        })
        
        //3)Return true
        return true
        
    }
    
    func signUp(signUpForm : SignUpForm) -> Bool{
        
        //1)Set User Fields
        let user = PFUser()
        user.username = signUpForm.identifier
        user.password = signUpForm.password

        //other fields can be set if you want to save more information
        user["phone"] = "415-960-5816"
        user["email"] = "davidkwokhochan@gmail.com"
       
        //2)Sign up user with parse SDK
        user.signUpInBackgroundWithBlock{ (success, error) -> Void in
            if error == nil {
                
                //FIRE SUCCESS DELEGATE
                
            } else {
                
                //FIRE FAILURE DELEGATE
                
            }
        }
        
        //3)Return true
        return true
        
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
    
    func postItem(item: ItemModel) -> Bool {
        
        //Todo: Implement
        return false
        
    }
    
    func postImage(image: UIImage)-> Bool {
        
        //Todo: Implement
        return false
        
    }


    
}