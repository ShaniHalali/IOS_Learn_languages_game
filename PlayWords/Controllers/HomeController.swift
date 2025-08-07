//
//  HomeController.swift
//  PlayWords
//
//  Created by Shani Halali on 27/07/2025.
//

import UIKit

class HomeController: UIViewController {
    @IBOutlet weak var scoerLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let user_key = UserDefaults.standard.string(forKey: "user_key") {
            // save in user defaults the user's language and difficulty
            
            FirebaseUserInfo.info.getUselanguge(user_key: user_key){ language in
                if let userLanguage = language {
                    print ("user_language = \(userLanguage)")
                    UserDefaults.standard.set(userLanguage, forKey: "user_language")
                    
                }else{
                    print("user_language = nil")
                }
                
            }
            
            FirebaseUserInfo.info.getUserDifficlity(user_key: user_key){ difficulty in
                if let userDifficulty = difficulty {
                    print("user_difficulty = \(userDifficulty)")
                    UserDefaults.standard.set(userDifficulty, forKey: "user_difficulty")
                }else{
                    print("user_difficulty = nil")
                }
            }
            
            
            print("user_key from preferences: \(user_key)")
            FirebaseUserInfo.info.getUserScore(user_key: user_key){ score in
                print("check firebase")
                if let user_score = score {
                    self.scoerLabel.text = "🏆 : \(user_score)"
                    UserDefaults.standard.set(user_key, forKey: "user_key")
                    
                } else {
                    print("No user_key saved.")
                    self.scoerLabel.text = "🏆 : 0"
                    
                }
            }
        }
    }
    
    @IBAction func logOutTapped(_ sender: Any) {
        //remove the current user key
        UserDefaults.standard.removeObject(forKey: "user_key")
        print("key removed")
        
        //go out to login screen
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let loginVC = storyboard.instantiateViewController(withIdentifier: "LogInController")
        loginVC.modalPresentationStyle = .fullScreen
        self.present(loginVC, animated: true, completion: nil)
    }
    
}
