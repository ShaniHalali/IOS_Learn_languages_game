//
//  LogInController.swift
//  PlayWords
//
//  Created by Shani Halali on 31/07/2025.
//

import UIKit

class LogInController: UIViewController {

    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func loginButtonTapped(_ sender: Any) {
        let email = emailTextField.text
        let password = passwordTextField.text
        
                if email?.isEmpty == true || password?.isEmpty == true{
                    showAlert(message:"Please enter both email and password")
                    return
                }
        print("email \(email!)")
        print("password \(password!)")
        FirebaseAuthManager.shared.loginUser(email: email!, password: password!) { success, errorMessage in
            print("check firebase")
            if success {
                print("Login successful !")
                self.goToHomeScreen()
            }else{
                self.showAlert(message:"Login failed")
                print("login failed")
            }
            
        }
        
    }
    
    func showAlert(message: String) {
        let alert = UIAlertController(title: "Login Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
    
    func  goToHomeScreen(){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let homeVC = storyboard.instantiateViewController(withIdentifier: "HomeController") as! HomeController
        self.present(homeVC, animated: true, completion: nil)

    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
