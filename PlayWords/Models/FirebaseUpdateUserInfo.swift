//
//  FirebaseUserDataManager.swift
//  PlayWords
//
//  Created by Shani Halali on 01/08/2025.
//

import FirebaseCore
import FirebaseDatabase

class FirebaseUpdateUserInfo {
    
    static let update = FirebaseUpdateUserInfo()
    
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
        ref.child(key).child("lan").setValue(updateLanTo) { error, _ in
            completion(error == nil)
        }
    }
    
    func addScore(userKey: String, pointsToAdd: Int, completion: @escaping (_ success: Bool, _ updatedScore: Int?) -> Void ) {
        let scoreRef = ref.child(userKey).child("score")
        
        scoreRef.runTransactionBlock({ currentData -> TransactionResult in
            // get current data score
            var scoreValue = currentData.value as? Int ?? 0
            
            // add the points
            scoreValue += pointsToAdd
            
            // set the new score value
            currentData.value = scoreValue
            
            // return the updated data to firebase
            return TransactionResult.success(withValue: currentData)
            
        }, andCompletionBlock: { error, committed, snapshot in
            if let error = error {
                print("Transaction error: \(error.localizedDescription)")
                completion(false, nil)
                return
            }
            
            // If not committed, something went wrong
            guard committed else {
                completion(false, nil)
                return
            }
            
            // Get the updated score from snapshot
            let updatedScore = snapshot?.value as? Int
            completion(true, updatedScore)
        })
        
    }
    
    
}

