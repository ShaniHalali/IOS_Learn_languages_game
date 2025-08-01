//
//  FirebaseUserDataManager.swift
//  PlayWords
//
//  Created by Shani Halali on 01/08/2025.
//

import FirebaseCore
import FirebaseDatabase

class FirebaseUserSettingsManager {
    
    static let update = FirebaseUserSettingsManager()
    
    private let databaseURL = "https://word-game---ios-default-rtdb.europe-west1.firebasedatabase.app"
    
    private var ref: DatabaseReference

    private init() {
        self.ref = Database.database(url: databaseURL).reference().child("users")
    }

    func updateDifficulty(key: String, updateDifTo: String, completion: @escaping (Bool) -> Void) {
        ref.child(key).child("difficulty").setValue(updateDifTo) { error, _ in
            completion(error == nil)
        }
    }
    
    func updateLanguage(key: String, updateLanTo: String, completion: @escaping (Bool) -> Void) {
        ref.child(key).child("language").setValue(updateLanTo) { error, _ in
            completion(error == nil)
        }
    }
    
  
}
