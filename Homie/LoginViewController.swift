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
        MockBackendData()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func loginButtonPressed(){
        
        var loginForm = LoginForm(identifier : identifierTextField.text!
            ,password : passwordTextField.text!)
        handleLoginResponse(loginAction(loginForm))
        
    }
    
    func loginAction(form : LoginForm) -> Bool {
        
        if !form.identifier.isEmpty && !form.password.isEmpty{
            return backEndManager.login(form)
        }
        return false
        
    }
    
    func handleLoginResponse(success : Bool){

        if(!developmentMode){
            presentViewController(AlertHelper().createAlertController(success)
                , animated: true, completion: nil)
        }
        
    }
}
