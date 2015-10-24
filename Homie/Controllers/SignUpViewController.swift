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
        var result : Bool = self.signUpAction(form)
        
        //3)If success, pop self
        
        if result == true{
            
            //TODO: implement
            
        }
        
    }
    
    func signUpAction(form : SignUpForm) -> Bool {
        
        //1)Ping BE Manager to sign up given the Form
        var backEnd : BackEndProtocol = ParseManager()
        var result = backEnd.signUp(form)
        
        //2)Show response to user in an alert dialog
        showResponseAlert(result)
        
        //3)Return result to caller
        return result

    }
    
    func showResponseAlert(success : Bool){
        
        var title = "Failure"
        var message = "Sign Up failed"
        
        if success {
            
            title = "Succeeded"
            message = "Sign Up Succeeded"
        }
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .Alert)
        
        let defaultAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
        alertController.addAction(defaultAction)
        
        if(!developmentMode){
            presentViewController(alertController, animated: true, completion: nil)
        }
        
    }
    
}