//
//  FirebaseWordsManager.swift
//  PlayWords
//
//  Created by Shani Halali on 07/08/2025.
//

import Foundation
import FirebaseDatabase

struct Word {
    let foreignWord: String
    let translation: String
}

struct TranslationQuestion {
    let foreignWord: String
    let shownTranslation: String
    let isCorrect: Bool
}

class FirebaseWordsManager {
    
    static let shared = FirebaseWordsManager()
    
    private let databaseURL = "https://word-game---ios-default-rtdb.europe-west1.firebasedatabase.app"
    
    private var ref: DatabaseReference
    
    private init() {
        self.ref = Database.database(url: databaseURL).reference().child("words")
    }
    
    func generateTranslationQuestion(language: String, difficulty: String, completion: @escaping (TranslationQuestion?) -> Void) {
        
        ref.child(language).child(difficulty).observeSingleEvent(of: .value) { snapshot in
            if !snapshot.exists() {
                completion(nil)
                return
            }
            //list of all the words in the firebase that are rellevant for the user's settings
            var wordsList: [Word] = []
            
            for child in snapshot.children {
                if let snap = child as? DataSnapshot,
                   let data = snap.value as? [String: Any],
                   let translation = data["translation"] as? String {
                    
                    let word = Word(foreignWord: snap.key, translation: translation)
                    wordsList.append(word)
                }
            }
            
            
            let wordsSize = wordsList.count
            let randomWordIndex = Int.random(in: 0..<wordsSize)
            let wordSelected = wordsList[randomWordIndex]
            let randomTranslationIndex = Int.random(in: 0..<wordsSize)
            let translationSelected = wordsList[randomTranslationIndex].translation
            
            let isCorrect = (wordSelected.translation == translationSelected)

            let question = TranslationQuestion(foreignWord: wordSelected.foreignWord, shownTranslation: translationSelected, isCorrect: isCorrect)
            
            completion(question)
        }
        
    }
    
    
}
