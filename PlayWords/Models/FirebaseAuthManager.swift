//
//  FirebaseAuthManager.swift
//  PlayWords
//
//  Created by Shani Halali on 30/07/2025.
//

import Foundation
import FirebaseCore
import FirebaseDatabase

class FirebaseAuthManager {
    
    static let shared = FirebaseAuthManager()
    
    private let databaseURL = "https://word-game---ios-default-rtdb.europe-west1.firebasedatabase.app"
    private var ref: DatabaseReference

    private init() {
        // Initialize reference with correct database URL
        self.ref = Database.database(url: databaseURL).reference().child("users")
    }
    
    func loginUser(email: String, password: String, completion: @escaping (Bool, String?) -> Void) {
        let formattedEmail = formatEmail(email)
        
        ref.child(formattedEmail).observeSingleEvent(of: .value) { snapshot in
            if !snapshot.exists() {
                completion(false, "Email not found")
                return
            }
            
            guard let userData = snapshot.value as? [String: Any],
                  let storedPassword = userData["password"] as? String else {
                completion(false, "Invalid data format")
                return
            }
            
            if storedPassword == password {
                completion(true, nil)
            } else {
                completion(false, "Incorrect password")
            }
        }
    }
    
    private func formatEmail(_ email: String) -> String {
        return email
            .replacingOccurrences(of: ".", with: "_")
            .replacingOccurrences(of: "@", with: "_")
    }
}

