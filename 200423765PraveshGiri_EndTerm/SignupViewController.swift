//
//  SignupViewController.swift
//  200423765PraveshGiri_EndTerm
//
//  Created by Pravesh Giri on 2019-12-04.
//  Copyright © 2019 Pravesh Giri. All rights reserved.
//

import UIKit

class SignupViewController: UIViewController {

    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var confirmPasswordTF: UITextField!
    @IBOutlet weak var usernameTF: UITextField!
    @IBOutlet weak var bioTF: UITextField!
    
    @IBAction func takePictureButton(_ sender: Any) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Register Screen"
        
        // Do any additional setup after loading the view.
    }
    

    @IBAction func signupButton(_ sender: Any) {
        //lets check for empty
        if(!checkForEmpty()){
            //is emmail valid
            if(isValidEmail(emailStr: emailTF.text!)){
                
                //is password valid
                if(isValidPassword(emailStr: passwordTF.text!)){
                    
                    
                    //are both passwords the same
                    if(passwordTF.text! == confirmPasswordTF.text!){
                        
                        performSegue(withIdentifier: "toProfileVC", sender: self)
                        
                        
                        
                    }else{
                        showAlert( message: "Passwords should be the same.")
                    }
                }else{
                     showAlert( message: "Password should be minimum 8 characters at least 1 Alphabet, 1 Number and 1 Special Character")
                }
            } else{
                showAlert( message: "Email should be valid.")
            }
            
        }else{
            showAlert( message: "fields can not be empty")
        }
        
    }
    
    func checkForEmpty() -> Bool {
   
        if emailTF.text != ""
        && passwordTF.text != ""
        && confirmPasswordTF.text != ""
        && usernameTF.text != ""
            && bioTF.text != "" {
            
            return false
        }else{
            return true
        }
    
    }
    
    func isValidEmail(emailStr:String) -> Bool {
        
        if emailStr == "" {
            return false
        }
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: emailStr)
    }
    
    func isValidPassword(emailStr:String) -> Bool {
        
        if emailStr == "" {
            return false
        }
        let emailRegEx = "^(?=.*[A-Za-z])(?=.*\\d)(?=.*[$@$!%*#?&])[A-Za-z\\d$@$!%*#?&]{8,}$"
        
        
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: emailStr)
    }
    
    func showAlert(message: String
            ){
        let alertController = UIAlertController(title: "Alert", message:
            message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toProfileVC" {
//            
            
            let secondViewController = segue.destination as! ProfileViewController
            secondViewController.email = emailTF.text!
            secondViewController.bio = bioTF.text!
        }
    }
    

}
