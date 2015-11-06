//
//  ViewController.swift
//  Homie
//
//  Created by davix on 10/3/15.
//  Copyright © 2015 Homie. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController , APIonCompleteProtocol{

    @IBOutlet weak var identifierTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    var developmentMode: Bool = true
    
    var apiManager : APIManager = APIManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //USER TRIGGERD FUNCTIONS
    
    @IBAction func loginButtonPressed(){
        
        let loginForm = LoginForm(identifier : identifierTextField.text!
            ,password : passwordTextField.text!)
        
        self.loginAction(loginForm)
        
    }
    
    func loginAction(form : LoginForm) -> Bool {
        
        if self.loginFormPassesValidation(form){
        
            return self.apiManager.login(form , onComplete: self)
        
        }else{
            
            //Alert User that input is invalid
            presentViewController(
                AlertHelper().createAlertController("Form Validation", success : false), animated: true, completion: nil)
            return false
        
        }
        
    }
    
    func handleLoginResponse(success : Bool){


        self.loginCompelete()
        
    }
    
    func loginFormPassesValidation(loginForm : LoginForm) -> Bool {
    
        if !loginForm.identifier.isEmpty && !loginForm.password.isEmpty{
            let utils = Utils()
            return utils.validIdentifier(loginForm.identifier) &&
                utils.validPassword(loginForm.password)
        }
        return false
        
    }
    
    //NETWORK TRIGGERD FUNCTIONS
    
    func onNetworkSuccess(nsobject : NSObject){
        
        if(!developmentMode){
            presentViewController(AlertHelper().createAlertController("Login", success : true)
                , animated: true, completion: nil)
        }
        self.loginCompelete()
        
    }
    
    func onNetworkFailure(statusCode : Int , message : String){
        
        //Alert User that input is invalid
        presentViewController(
            AlertHelper().createAlertController("Login", success : false), animated: true, completion: nil)
        
    }
    
    func loginCompelete(){
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let tabBarController = storyBoard.instantiateViewControllerWithIdentifier("tabBar") as! TabBarController
        self.presentViewController(tabBarController, animated:true, completion:nil)
        
    }
    
}
