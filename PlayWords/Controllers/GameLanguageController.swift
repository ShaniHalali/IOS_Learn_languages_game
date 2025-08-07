//
//  GameLanguageController.swift
//  PlayWords
//
//  Created by Shani Halali on 07/08/2025.
//

import UIKit

class GameLanguageController: UIViewController {
    
    @IBOutlet weak var translationLable: UILabel!
    @IBOutlet weak var foreignWordLable: UILabel!
    @IBOutlet weak var lifeLable: UILabel!
    @IBOutlet weak var scoreLable: UILabel!
    
    var currentExpectedAnswer: Bool = false
    var userLife = 3
    var currentScore = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        if UserDefaults.standard.string(forKey: "user_key") != nil {
            if let userLanguage = UserDefaults.standard.string(forKey: "user_language"){
                print("user_difficulty = \(userLanguage)")
                
                if let userDifficulty = UserDefaults.standard.string(forKey: "user_difficulty") {
                    print("user_difficulty = \(userDifficulty)")
                    
                    
                    FirebaseWordsManager.shared.generateTranslationQuestion(language: userLanguage, difficulty: userDifficulty){question in
                        if let question = question  {
                            self.setQuestionCard(foreignWord: question.foreignWord, translation: question.shownTranslation, answer: question.isCorrect)
                            
                        }
                    }
                }
            }
           
            
            
            
        }
        
    }
    
    // MARK: - end of
    
    func setQuestionCard(foreignWord: String, translation: String, answer: Bool ) {
        
        self.foreignWordLable.text = foreignWord
        self.translationLable.text = translation
        self.currentExpectedAnswer = answer
        
        print("foreignWord = \(foreignWord) ,translation = \(translation), expected answer = \(answer) ")
        
    }
    
    func checkAnswer (userAnswer: Bool){
        if (currentExpectedAnswer && userAnswer) || (!currentExpectedAnswer && !userAnswer){
            currentScore += 10
            scoreLable.text = "Score: \(currentScore)"
            print("✅ Correct answer")
        }else{
            print("❌ Wrong answer")
            userLife -= 1
            checkUserLife(userLife: userLife)
        }
    }
    
    func  checkUserLife(userLife: Int){
        if userLife == 2 {
            lifeLable.text = "❤️❤️"
        }else if userLife == 1 {
            lifeLable.text = "❤️"
        }else{
            lifeLable.text = "Game over"
        }
    }
    
    
    @IBAction func currectButtonTapped(_ sender: Any) {
        checkAnswer(userAnswer: true)
        print("user tapped = true")
    }
    
    @IBAction func wrongButtonTapped(_ sender: Any) {
        print("user tapped = false")

        checkAnswer(userAnswer: false)

    }
    
}
