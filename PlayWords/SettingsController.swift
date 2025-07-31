//
//  SettingsController.swift
//  PlayWords
//
//  Created by Shani Halali on 31/07/2025.
//

import UIKit

class SettingsController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var lanSegment: UISegmentedControl!
    @IBOutlet weak var easySwitch: UISwitch!
    @IBOutlet weak var midSwitch: UISwitch!
    @IBOutlet weak var proSwitch: UISwitch!
    
    var user_key: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let user_key = UserDefaults.standard.string(forKey: "user_key") {
            print("user_key from preferences to settings: \(user_key)")
            
            
            //name field
            let name = FirebaseUserInfo.info.getUserName(user_key: user_key) { success in
                if let name = success {
                    self.nameTextField.text = name
                }else{
                    print("name is nil")
                }
            }
            
            //email field
            let email = FirebaseUserInfo.info.getUseremail(user_key: user_key) { success in
                if let email = success {
                    self.emailTextField.text = email
                }else{
                    print("email is nil")
                }
            }
            
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
