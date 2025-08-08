//
//  FirebaseUserInfo.swift
//  PlayWords
//
//  Created by Shani Halali on 31/07/2025.
//

import Foundation
import FirebaseCore
import FirebaseDatabase

class FirebaseUserInfo {
    
    static let info = FirebaseUserInfo()
    
    private let databaseURL = "https://word-game---ios-default-rtdb.europe-west1.firebasedatabase.app"
    
    private var ref: DatabaseReference
    
    private init() {
        // Initialize reference with correct database URL
        self.ref = Database.database(url: databaseURL).reference().child("users")
    }
    
    func getUserName(user_key: String, completion: @escaping (String?) -> Void) {
        ref.child(user_key).child("username").observeSingleEvent(of: .value) { snapshot in
            let username = snapshot.value as? String
            print("username: \(username ?? "not found")")
            completion(username)
        }
    }
    
    
    
    func getUserScore (user_key: String, completion: @escaping (Int?) -> Void){
        ref.child(user_key).child("score").observeSingleEvent(of: .value){snapshot in
            if let score = snapshot.value as? Int{
                print("score: \(score)")
                completion(score)
            }else{
                print("not found")
                completion(000)
            }
        }
        
    }
    
    func getUserDifficlity(user_key: String, completion: @escaping (String?) -> Void) {
        ref.child(user_key).child("difficulty").observeSingleEvent(of: .value) { snapshot in
            let difficulty = snapshot.value as? String
            print("difficulty: \(difficulty ?? "not found")")
            completion(difficulty)
        }
    }
    
    func getUseremail(user_key: String, completion: @escaping (String?) -> Void) {
        ref.child(user_key).child("email").observeSingleEvent(of: .value) { snapshot in
            let email = snapshot.value as? String
            print("email: \(email ?? "not found")")
            completion(email)
        }
    }
    
    func getUselanguge(user_key: String, completion: @escaping (String?) -> Void) {
        ref.child(user_key).child("lan").observeSingleEvent(of: .value) { snapshot in
            let languge = snapshot.value as? String
            print("languge: \(languge ?? "not found")")
            completion(languge)
        }
    }
    
    
    
}
