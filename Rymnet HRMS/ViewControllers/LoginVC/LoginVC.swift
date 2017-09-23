//
//  ViewController.swift
//  Rymnet HRMS
//
//  Created by Aviru bhattacharjee on 20/09/17.
//  Copyright © 2017 com.aviru. All rights reserved.
//

import UIKit

class LoginVC: BaseVC,UITextFieldDelegate {
    
    var strEmail = "",strPassword = ""
    var globalTxtField : UITextField!
    
    
    @IBOutlet var txtEmail: UITextField!
    
    @IBOutlet var txtPassword: UITextField!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
    }
    
    // MARK: - Textfield Delegates
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        globalTxtField = textField
    }
    
    @IBAction func txtFieldEdit(_ sender: UITextField) {
        
        if globalTxtField == txtEmail {
            
            if let email = globalTxtField.text?.trim() {
                
                strEmail = email
            }
            else{
                
                strEmail = ""
            }
        }
        
        if globalTxtField == txtPassword {
            
            if let password = globalTxtField.text?.trim() {
                
                strPassword = password
            }
            else{
                
                strPassword = ""
            }
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    // MARK:-
    
    // MARK: - Button Action
    
    @IBAction func btnLoginAction(_ sender: Any) {
        
        self.view.endEditing(true)
        
        if alert() {
            
            activityIndicator.startAnimating()
            
            
        }
    }
    
    //MARK:- alert
    
    func alert() -> Bool {
        if (strEmail.characters.count == 0) {
            
            showAlertMessage(titl: "", msg: "Please enter email", displayTwoButtons: false)
            return false
        }
        
        if (validateEmail(strEmail) == false) {
            
            showAlertMessage(titl: "", msg: "Please enter valid email", displayTwoButtons: false)
            return false
        }
        
        if (strPassword.characters.count == 0) {
            
            showAlertMessage(titl: "", msg: "Please enter password", displayTwoButtons: false)
            return false
        }
        return true
    }
    
    //MARK:-
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

