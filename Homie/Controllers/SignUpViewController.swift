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
        
        //2)Get boolean result code
        var signUpResult : Bool = getSuccessFromCode(result)
        
        //3)Show response to user in an alert dialog
        showResponseAlert(signUpResult)
        
        //4)Return result to caller
        return signUpResult

    }
    
    
    func getSuccessFromCode(result : Int) -> Bool{
    
        if result == 200{
            return true
        }else{
            return false
        }
    }
    
    func showResponseAlert(success : Bool){
        
        var title = "Failure"
        var message = "Login failed"
        
        if success {
            
            title = "Succeeded"
            message = "Login Succeeded"
        }
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .Alert)
        
        let defaultAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
        alertController.addAction(defaultAction)
        
        if(!developmentMode){
            presentViewController(alertController, animated: true, completion: nil)
        }
        
    }
    
}