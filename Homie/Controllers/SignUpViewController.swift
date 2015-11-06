//
//  SignUpController.swift
//  Homie
//
//  Created by davix on 10/22/15.
//  Copyright © 2015 Homie. All rights reserved.
//

import Foundation
import UIKit

class SignUpViewController: UIViewController , APIonCompleteProtocol{

    var developmentMode: Bool = true

    var apiManager : APIManager = APIManager()
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var identifierTextField: UITextField!
    
    //USER TRIGGERD FUNCTIONS
    
    @IBAction func signUpButtonPressed() -> Void {
        
        //1)Create a SignUp Form
        let form : SignUpForm = SignUpForm(identifier: self.identifierTextField.text!, password: self.passwordTextField.text!)
        
        self.signUpAction(form)
        
    }
    
    func signUpAction(form : SignUpForm) -> Bool {
        
        if(self.signUpFormPassesValidation(form)){
            
            return self.apiManager.signUp(form, onComplete: self)
            
        }else{
            
            //2b)Display error Prompt "Invalid Identifier
            presentViewController(
                AlertHelper().createAlertController("Form Validation", success : false), animated: true, completion: nil)
            return false
            
        }

    }
    
    
    func signUpFormPassesValidation(form: SignUpForm) -> Bool {
        
        let utils = Utils()
        return utils.validIdentifier(form.identifier) && utils.validPassword(form.password)
        
    }
    
    //NETWORK TRIGGERD FUNCTIONS
    
    func onNetworkSuccess(nsobject : NSObject){
        
        if(!developmentMode){
            presentViewController(AlertHelper().createAlertController("Sign Up", success : true)
                , animated: true, completion: nil)
        }
        self.signUpComplete()
        
    }
    
    func onNetworkFailure(statusCode : Int , message : String){
        
        //Alert User that input is invalid
        presentViewController(
            AlertHelper().createAlertController("Sign Up", success : false), animated: true, completion: nil)
        
    }
    
    func signUpComplete(){
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let tabBarController = storyBoard.instantiateViewControllerWithIdentifier("tabBar") as! TabBarController
        self.presentViewController(tabBarController, animated:true, completion:nil)
        
    }
    
}