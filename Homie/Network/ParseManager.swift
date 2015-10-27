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

class ParseManager : BackEndProtocol{
    
    var erroredOnPreviousCall : Bool = false
    
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
                self.erroredOnPreviousCall = false
                    //Update view with Error
            }else {
                self.erroredOnPreviousCall = true
                //Update view with Error
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
                
                self.erroredOnPreviousCall = false
                //Update view with Error
                
            } else {
                
                self.erroredOnPreviousCall = true
                //Update controller
                
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
    
    func postItem(item: ItemModel) -> Int {
        
        //Todo: Implement
        return 0
        
    }
    
    func postImage(image: UIImage)-> Int {
        
        //Todo: Implement
        return 0
        
    }


    
}