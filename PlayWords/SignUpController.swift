//
//  SignUpController.swift
//  PlayWords
//
//  Created by Shani Halali on 01/08/2025.
//

import UIKit

class SignUpController: UIViewController {
    
    @IBOutlet weak var languageSegmant: UISegmentedControl!
    @IBOutlet weak var difficultySegment: UISegmentedControl!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }
    
    @IBAction func signupTapped(_ sender: Any) {
        
        guard let name = nameTextField.text, !name.isEmpty,
              let email = emailTextField.text, !email.isEmpty,
              let password = passwordTextField.text, !password.isEmpty else {
            showAlert(message: "Please enter all fields")
            return
        }
        
        FirebaseSignupManager.create.isAvaliableEmail(email: email) { emailSuccess, _ in
            if !emailSuccess {
                self.showAlert(message: "This email is already taken")
                return
            }
            
            FirebaseSignupManager.create.isAvaliableUsername(username: name) { usernameSuccess, _ in
                if !usernameSuccess {
                    self.showAlert(message: "This username is already taken")
                    return
                }
                
                self.createNewUser(email: email , username: name, password: password)
            }
        }
    }
    
    
    func createNewUser(email: String, username: String, password: String) {
        
        let difficulty = getUserDifficulty()
        let language = getUserLanguage()
        
        // MARK: create new user in firebase
        
        FirebaseSignupManager.create.createNewAccount(email: email, username: username, password: password, difficulty: difficulty, language: language){ success, error in
            if success {
                print("User created successfully!")
                self.goToHomeScreen(email: email)
                
            }else{
                print("Error: \(error ?? "Unknown error")")
                
            }
        }
        
    }
    
    // MARK: end of viewdodload
    
    func showAlert(message: String) {
        let alert = UIAlertController(title: "sign up Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
    func getUserDifficulty() -> String {
        
        let index = difficultySegment.selectedSegmentIndex
        
        if index == 0 {
            return "easy"
        }else if index == 1 {
            return "mid"
        }
        
        return "pro"
        
    }
    
    func getUserLanguage() -> String {
        let index = languageSegmant.selectedSegmentIndex
        
        if index == 0 {
            return "spanish"
        }
        
        return "english"
    }
    
    func goToHomeScreen(email: String){
        if let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let window = scene.windows.first {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            
            if let tabBarController = storyboard.instantiateViewController(withIdentifier: "MainTabBar") as? UITabBarController {
                
                if tabBarController.viewControllers?.first is HomeController {
                    let userKey = FirebaseAuthManager.shared.formatEmail(email)
                    UserDefaults.standard.set(userKey, forKey: "user_key")
                    
                    window.rootViewController = tabBarController
                    window.makeKeyAndVisible()
                }
            }
        }
    }
    
    
    
}
