//
//  SignUpController.swift
//  Homie
//
//  Created by davix on 10/22/15.
//  Copyright © 2015 Homie. All rights reserved.
//

import Foundation
import UIKit

class SignUpViewController: UIViewController{

    var developmentMode: Bool = true
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var identifierTextField: UITextField!
    
    @IBAction func signUpButtonPressed() -> Void {
        
        //1)Get the username , password from the user
        var userName : String = self.identifierTextField.text!
        var password : String = self.passwordTextField.text!
        
        //2)Create a SignUp Form
        var form : SignUpForm = SignUpForm(identifier: userName, password: password)
        
        if(self.signUpFormPassesValidation(form)){
            
            var result : Bool = self.signUpAction(form)
            
            //2a)If success, show tab view contoller
            self.handleSignUpResponse(result)
            
        }else{
            
            //2b)Display error Prompt "Invalid Identifier
            presentViewController(
                AlertHelper().createAlertController("Form Validation", success : false), animated: true, completion: nil)
        }

        
    }
    
    func signUpAction(form : SignUpForm) -> Bool {
        
        //1)Ping BE Manager to sign up given the Form
        var backEnd : BackEndProtocol = ParseManager()
        
        //2)Return result to caller
        return backEnd.signUp(form)

    }
    
    func handleSignUpResponse(success : Bool){
        
        if(!developmentMode){
            presentViewController(
                AlertHelper().createAlertController("Sign Up", success: success), animated: true, completion: nil)
        }
        
    }
    
    func signUpFormPassesValidation(form: SignUpForm) -> Bool {
        
        let utils = Utils()
        return utils.validIdentifier(form.identifier) && utils.validPassword(form.password)
        
    }
    
}