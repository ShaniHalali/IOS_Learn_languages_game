//
//  FirebaseUsersLeaderboard.swift
//  PlayWords
//
//  Created by Shani Halali on 08/08/2025.
//

import Foundation
import FirebaseDatabase

struct UserRank {
    var username: String
    var score: Int
}

class FirebaseUsersLeaderboard {
    static let shared = FirebaseUsersLeaderboard()
    
    private let databaseURL = "https://word-game---ios-default-rtdb.europe-west1.firebasedatabase.app"
    
    private var ref: DatabaseReference
    
    private init() {
        self.ref = Database.database(url: databaseURL).reference().child("users")
    }
    
    func fetchUsersRecord(completion: @escaping ([UserRank]) -> Void) {
        
        ref.observeSingleEvent(of: .value) { snapshot in
            if !snapshot.exists() {
                completion([])
                return
            }
            
            // created list of all users, each element will be - UserRank object
            
            var usersRecordsList: [UserRank] = []
            
            for child in snapshot.children {
                if let snap = child as? DataSnapshot,
                   let data = snap.value as? [String: Any],
                   let username = data["username"] as? String,
                   let score = data["score"] as? Int
                {
                    let user = UserRank(username: username, score: score)
                    usersRecordsList.append(user)
                }
            }
            
            // sorted list from the highest score to down
            usersRecordsList.sort { $0.score > $1.score }
            completion(usersRecordsList)
            
        }
    }
}


