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
            print("user_key from preferences: \(user_key)")
            let user_score = FirebaseUserInfo.info.getUserScore(user_key: user_key){ score in
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
