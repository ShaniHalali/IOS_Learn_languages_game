//
//  SettingsController.swift
//  PlayWords
//
//  Created by Shani Halali on 31/07/2025.
//

import UIKit

class SettingsController: UIViewController {
    
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var lanSegment: UISegmentedControl!
    @IBOutlet weak var easySwitch: UISwitch!
    @IBOutlet weak var midSwitch: UISwitch!
    @IBOutlet weak var proSwitch: UISwitch!
    
    var user_key: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let user_key = UserDefaults.standard.string(forKey: "user_key") {
            print("user_key from preferences to settings: \(user_key)")
            
            FirebaseUserInfo.info.getUserName(user_key: user_key) { success in
                if let name = success {
                    DispatchQueue.main.async {
                        self.nameLabel.text = "Name: \(name)"
                    }
                } else {
                    DispatchQueue.main.async {
                        self.nameLabel.text = "Name not found"
                    }
                }
            }

            FirebaseUserInfo.info.getUseremail(user_key: user_key) { success in
                if let email = success {
                    DispatchQueue.main.async {
                        self.emailLabel.text = "Email: \(email)"
                    }
                } else {
                    DispatchQueue.main.async {
                        self.emailLabel.text = "Email not found"
                    }
                }
            }

            
            /*
            //name label
            let name = FirebaseUserInfo.info.getUserName(user_key: user_key) { success in
                if let name = success {
                    self.nameLabel.text = "Name: \(name)"
                }else{
                    print("name is nil")
                    self.nameLabel.text = "Name : is nil"

                }
            }
             
            
            //email label
            let email = FirebaseUserInfo.info.getUseremail(user_key: user_key) { success in
                if let email = success {
                    self.emailLabel.text = "Email: \(email)"
                }else{
                    print("email is nil")
                    self.emailLabel.text = "Email: is nil"

                }
            }
             */
            
            //language
            let lan = FirebaseUserInfo.info.getUselanguge(user_key: user_key) { success in
                if let lan = success{
                    if lan.elementsEqual("spanish"){
                        self.lanSegment.selectedSegmentIndex = 2
                    }else{
                        self.lanSegment.selectedSegmentIndex = 1
                        
                    }
                }else{
                    print("lan is nil")
                    
                }
                
            }
            
            // difficulty switches
            let difficulty = FirebaseUserInfo.info.getUserDifficlity(user_key: user_key) { success in
                if let difficulty = success{
                    if difficulty.elementsEqual("easy"){
                        self.easySwitch.isOn = true
                        self.midSwitch.isOn = false
                        self.proSwitch.isOn = false
                        
                    }else if difficulty.elementsEqual("mid"){
                        self.easySwitch.isOn = false
                        self.midSwitch.isOn = true
                        self.proSwitch.isOn = false
                        
                    }else{
                        self.easySwitch.isOn = false
                        self.midSwitch.isOn = false
                        self.proSwitch.isOn = true                }
                }
            }
            
        }
    }
    
}
