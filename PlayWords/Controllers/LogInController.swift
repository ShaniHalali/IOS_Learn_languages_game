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
    var user_key: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        //chack in firebase
        FirebaseAuthManager.shared.loginUser(email: email!, password: password!) { success, errorMessage in
            print("check firebase")
            if success {
                print("Login successful!")
                self.goToHomeScreen(email: email!)
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
    
    func goToHomeScreen(email: String) {
        if let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let window = scene.windows.first {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            
            if let tabBarController = storyboard.instantiateViewController(withIdentifier: "MainTabBar") as? UITabBarController {
                
                if tabBarController.viewControllers?.first is HomeController {
                    let userKey = FirebaseAuthManager.shared.formatEmail(email)
                    UserDefaults.standard.set(userKey, forKey: "user_key")
                    
                    /* used user defaults insted pass the value
                     homeVC.user_key = userKey
                     print("user key = \(userKey)")
                     }else{
                     print("user key = nil")
                     
                     }
                     */
                    window.rootViewController = tabBarController
                    window.makeKeyAndVisible()
                }
            }
        }
    }
}
