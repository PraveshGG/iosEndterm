//
//  ViewController.swift
//  200423765PraveshGiri_EndTerm
//
//  Created by Pravesh Giri on 2019-12-04.
//  Copyright © 2019 Pravesh Giri. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    
    
    @IBAction func loginAction(_ sender: Any) {
        if(emailTF.text != "" && passwordTF.text != "") {
            if(!isValidPassword(emailStr: passwordTF.text!)){
                showAlert()
            } else if(isValidEmail(emailStr: emailTF.text!)){
                performSegue(withIdentifier: "toSignupVC", sender: self)

            }
        }
        
    }
    
    @IBAction func signupAction(_ sender: Any) {
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Login in to your app"
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toSignupVC" {
            if segue.destination is SignupViewController {
               // destViewController.dateAndTimeSelected = dateAndTime
            }
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
    
    func showAlert(){
        let alertController = UIAlertController(title: "Alert", message:
            "Password should be minimum 8 characters at least 1 Alphabet, 1 Number and 1 Special Character", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))
        
        self.present(alertController, animated: true, completion: nil)
    }
    //    /^(?=.*[A-Z].*[A-Z])(?=.*[!@#$&*])(?=.*[0-9].*[0-9])(?=.*[a-z].*[a-z].*[a-z]).{8}$

}

