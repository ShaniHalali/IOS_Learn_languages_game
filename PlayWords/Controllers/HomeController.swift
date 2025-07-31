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
}
