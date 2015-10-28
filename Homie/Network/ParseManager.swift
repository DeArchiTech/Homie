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
    
    var delegate : BackEndCallCompleteProtocol?
    
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

                self.delegate?.onNetworkSuccess(loggedInuser!)
                //FIRE SUCCESS DELEGATE
                
            }else {

                self.delegate?.onNetworkFailure(404, message: "Network Called Failed")
                //FIRE FAILURE DELEGATE
            }
        })
        
        return true
        
    }
    
    func signUp(signUpForm : SignUpForm) -> Bool{
        
        //1)Set User Fields
        let user = PFUser()
        user.username = signUpForm.identifier
        user.password = signUpForm.password
       
        //2)Sign up user with parse SDK
        user.signUpInBackgroundWithBlock{ (success, error) -> Void in
            if error == nil {
                
                self.delegate?.onNetworkSuccess(user)
                //FIRE SUCCESS DELEGATE
                
            } else {
                
                self.delegate?.onNetworkFailure(404, message: "Network Called Failed")
                //FIRE FAILURE DELEGATE
                
            }
        }
        
        return true
        
    }
    
    func getUser(userID : String) -> Bool {
        
        let query = PFQuery(className:"User")
        query.whereKey("objectId", equalTo: userID)
        query.findObjectsInBackgroundWithBlock {
        (objects: [PFObject]?, error: NSError?) -> Void in
            if objects != nil {
                
                self.delegate?.onNetworkSuccess(objects!)
                //FIRE SUCCESS DELEGATE
                
            }else {
                
                self.delegate?.onNetworkFailure(404, message: "Network Called Failed")
                //FIRE FAILURE DELEGATE
            }
        }
        
        return true
        
    }
    
    func getTrendingItems() -> Bool{
    
        let query = PFQuery(className: "Product")
        query.whereKey("Trending", equalTo: "1")
        query.findObjectsInBackgroundWithBlock {
            (objects: [PFObject]?, error: NSError?) -> Void in
            
            if error == nil {

                self.delegate?.onNetworkSuccess(objects!)
                //FIRE SUCCESS DELEGATE
            } else {
                
                self.delegate?.onNetworkFailure(404, message: "Network Called Failed")
                //FIRE FAILURE DELEGATE
                
            }
        }
        
        return true
    
    }

    func getSearchResults(jsonObject : JSON) -> Bool{
        
        let query = PFQuery(className: "Item")
        //TODO IMPLEMENT, THE CORRECT WHERE CLAUSE TO MATCH IN INPUT JSONOBJECT SEARCH FORM
        query.whereKey("Key", equalTo: "Value")
        
        query.findObjectsInBackgroundWithBlock {
            (objects: [PFObject]?, error: NSError?) -> Void in
            
            if error == nil {
                
                self.delegate?.onNetworkSuccess(objects!)
                //FIRE SUCCESS DELEGATE
            } else {
                
                self.delegate?.onNetworkFailure(404, message: "Network Called Failed")
                //FIRE FAILURE DELEGATE
                
            }
        }
        
        return true;
        
    }
    
    func postItem(item: ItemModel) -> Bool {
        
        let product = PFObject(className:"Product")

        product["Name"] = item.name
        product["Description"] = item.description
        product["PickUpPrice"] = item.pickUpPrice
        product["Deliver"] = item.deliveryPrice
        
        product.saveInBackgroundWithBlock {
            (success: Bool, error: NSError?) -> Void in
            if (success) {
                
                self.delegate?.onNetworkSuccess(success)
                //FIRE SUCCESS DELEGATE

            } else {
                
                self.delegate?.onNetworkFailure(404, message: "Network Called Failed")
                //FIRE FAILURE DELEGATE
            }
        }
        return true
        
    }
    
    func postImage(image: UIImage)-> Bool {
        
        let imageData = UIImagePNGRepresentation(image)
        let imageFile = PFFile(name:"image.png", data:imageData!)
        
        let image = PFObject(className:"Image")
        
        image["Name"] = "Item Image"
        image["Image"] = imageFile
        
        image.saveInBackgroundWithBlock {
            (success: Bool, error: NSError?) -> Void in
            if (success) {
                
                self.delegate?.onNetworkSuccess(success)
                //FIRE SUCCESS DELEGATE
                
            } else {
                
                self.delegate?.onNetworkFailure(404, message: "Network Called Failed")
                //FIRE FAILURE DELEGATE
            }
        }
        return true
        
    }
    
    func setDelegate(delegate : BackEndCallCompleteProtocol){
        
        self.delegate = delegate
    }
    
}