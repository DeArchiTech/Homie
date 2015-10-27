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
        
        //1)Create a SignUp Form
        let form : SignUpForm = SignUpForm(identifier: self.identifierTextField.text!, password: self.passwordTextField.text!)
        
        if(self.signUpFormPassesValidation(form)){
            
            let result : Bool = self.signUpAction(form)
            
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
        let backEnd : BackEndProtocol = ParseManager()
        
        //2)Return result to caller
        return backEnd.signUp(form)

    }
    
    func handleSignUpResponse(success : Bool){
        
        if(!developmentMode){
            presentViewController(
                AlertHelper().createAlertController("Sign Up", success: success), animated: true, completion: nil)
        }
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let tabBarController = storyBoard.instantiateViewControllerWithIdentifier("tabBar") as! TabBarController
        self.presentViewController(tabBarController, animated:true, completion:nil)
        
        
    }
    
    func signUpFormPassesValidation(form: SignUpForm) -> Bool {
        
        let utils = Utils()
        return utils.validIdentifier(form.identifier) && utils.validPassword(form.password)
        
    }
    
}