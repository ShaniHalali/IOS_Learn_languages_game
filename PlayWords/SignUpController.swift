//
//  SignUpController.swift
//  PlayWords
//
//  Created by Shani Halali on 01/08/2025.
//

import UIKit

class SignUpController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        

    }
    
    @IBAction func signupTapped(_ sender: Any) {
        let name = nameTextField.text
        let email = emailTextField.text
        let password = passwordTextField.text
        
        var emailAvaliable = false
        var usernameAvaliable = false
        
        if email?.isEmpty == true || name?.isEmpty == true || password?.isEmpty == true {
            showAlert(message: "Please enter all fiels")
        }
        
        //check if its uniqe user in firebase
        FirebaseSignupManager.create.isAvaliableEmail(email: email!) { success, message in
            if !success {
                self.showAlert(message: "This email is already Taken")
            }else{
               emailAvaliable = true
            }
        }
        
        FirebaseSignupManager.create.isAvaliableUsername(username: name!) { success, message in
            if !success{
                self.showAlert(message: "this username is already Taken")
            }else{
                usernameAvaliable = true
            }
        }
        
        if usernameAvaliable == true && emailAvaliable == true {
            // MARK: create new user in firebase

            goToHomeScreen()
        }
        
    }
    

    // MARK: end of viewdodload
    
    func showAlert(message: String) {
        let alert = UIAlertController(title: "sign up Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
    
    func goToHomeScreen(){
        // MARK: do it
        // create user defaults

        //move screen
    }


}
