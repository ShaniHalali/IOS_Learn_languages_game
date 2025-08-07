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
    
    var difficulty: String?
    
    var user_key: String?
    
    var key: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let user_key = UserDefaults.standard.string(forKey: "user_key") {
            print("user_key from preferences to settings: \(user_key)")
            
            key = user_key
            
            // upload user info from firebase
            fatchUsername(key: user_key)
            fatchUserEmail(key: user_key)
            fatchUserLan(key: user_key)
            fatchUserDifficulty(key: user_key)
            
            // ---user change settings---
            
            //user change his difficulty
            easySwitch.addAction(UIAction { [weak self] _ in
                self?.switchChanged(key: user_key, difficulty: "easy")
            }, for: .valueChanged)
            
            midSwitch.addAction(UIAction { [weak self] _ in
                self?.switchChanged(key: user_key, difficulty: "mid")
            }, for: .valueChanged)
            
            proSwitch.addAction(UIAction { [weak self] _ in
                self?.switchChanged(key: user_key, difficulty: "pro")
            }, for: .valueChanged)
        } else {
            print("user_key was not found in UserDefaults.")
        }
        
        //user change is learning language
        
        
        
        
    }
    
    func fatchUsername (key: String){
        FirebaseUserInfo.info.getUserName(user_key: key) { success in
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
    }
    
    func fatchUserEmail (key: String){
        FirebaseUserInfo.info.getUseremail(user_key: key) { success in
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
    }
    
    func fatchUserLan (key: String){
        FirebaseUserInfo.info.getUselanguge(user_key: key) { success in
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
        
    }
    
    func fatchUserDifficulty (key: String){
        
        FirebaseUserInfo.info.getUserDifficlity(user_key: key) { success in
            if let difficulty = success{
                if difficulty.elementsEqual("easy"){
                    self.easySwitchIsOn ()
                    
                }else if difficulty.elementsEqual("mid"){
                    self.midSwitchIsOn ()
                    
                }else{
                    self.proSwithIsOn ()
                }
            }
        }
    }
    
    func easySwitchIsOn () {
        self.easySwitch.isOn = true
        self.midSwitch.isOn = false
        self.proSwitch.isOn = false
    }
    
    func midSwitchIsOn () {
        self.easySwitch.isOn = false
        self.midSwitch.isOn = true
        self.proSwitch.isOn = false
    }
    
    func proSwithIsOn () {
        self.easySwitch.isOn = false
        self.midSwitch.isOn = false
        self.proSwitch.isOn = true
    }
    
    
    func switchChanged(key: String, difficulty: String ) {
        
        if difficulty.elementsEqual("easy"){
            easySwitchIsOn()
        } else if difficulty.elementsEqual("mid"){
            midSwitchIsOn()
        }else{
            proSwithIsOn()
        }
        updateUserDifficulty (key: key, diff:difficulty)
        
    }
    
    
    
    func updateUserDifficulty (key: String, diff: String){
        FirebaseUserSettingsManager.update.updateDifficulty(key: key, updateDifTo: diff) { success in
            if success {
                print("Difficulty successfully updated to \(diff)")
                UserDefaults.standard.set(diff, forKey: "user_difficulty")
                if let diffUpdate = UserDefaults.standard.string(forKey: "user_difficulty"){
                    print("user_difficulty = \(diffUpdate)")
                }
            } else {
                print("Failed to update difficulty")
            }
        }

    }
    
    @IBAction func segmentChangedByUser(_ sender: Any)  {
        var lan = ""
        if (sender as AnyObject).selectedSegmentIndex == 0{
            print("spanish selected by user")
            lan = "spanish"
        }else{
            print("english selected by user")
            lan = "english"
        }
        
        updateUserLanguage(key: key!, lan: lan)
    }
    
    func updateUserLanguage (key: String, lan: String ) {
        FirebaseUserSettingsManager.update.updateLanguage(key: key, updateLanTo: lan) { success in
            if success {
                print("Difficulty successfully updated to \(lan)")
                UserDefaults.standard.set(lan, forKey: "user_language")
                
                if let lanUpdate = UserDefaults.standard.string(forKey: "user_language"){
                    print("user_difficulty = \(lanUpdate)")
                }

            }else{
                print("Failed to update language")
                
            }
            
        }
    }
}
