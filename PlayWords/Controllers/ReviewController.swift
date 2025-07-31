//
//  ResultController.swift
//  PlayWords
//
//  Created by Shani Halali on 31/07/2025.
//

import UIKit

class ReviewController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let user_key = UserDefaults.standard.string(forKey: "user_key") {
            print("user_key from preferences: \(user_key)")
            let user_score = FirebaseUserInfo.info.getUserScore(user_key: user_key){ score in
                print("check firebase")
                if let user_score = score {
                    self.scoreLabel.text = "\(user_score)"
                    UserDefaults.standard.set(user_key, forKey: "user_key")
                    
                } else {
                    print("No user_key saved.")
                    self.scoreLabel.text = "0"
                    
                }
            }
            
            
            // Do any additional setup after loading the view.
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
}
