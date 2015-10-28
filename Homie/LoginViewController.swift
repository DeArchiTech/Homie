//
//  ViewController.swift
//  Homie
//
//  Created by davix on 10/3/15.
//  Copyright © 2015 Homie. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var identifierTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    var developmentMode: Bool = true
    
    var backEndManager : BackEndProtocol = MockBackEndManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func loginButtonPressed(){
        
        let loginForm = LoginForm(identifier : identifierTextField.text!
            ,password : passwordTextField.text!)
        
        handleLoginResponse(self.loginAction(loginForm))
        
    }
    
    func loginAction(form : LoginForm) -> Bool {
        
        if self.loginFormPassesValidation(form){
        
            return backEndManager.login(form)
        
        }else{
            
            //Alert User that input is invalid
            presentViewController(
                AlertHelper().createAlertController("Form Validation", success : false), animated: true, completion: nil)
            return false
        
        }
        
    }
    
    func handleLoginResponse(success : Bool){

        if(!developmentMode){
            presentViewController(AlertHelper().createAlertController("Login", success : success)
                , animated: true, completion: nil)
        }
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
    
    func loginCompelete(){
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let tabBarController = storyBoard.instantiateViewControllerWithIdentifier("tabBar") as! TabBarController
        self.presentViewController(tabBarController, animated:true, completion:nil)
        
    }
    
}
