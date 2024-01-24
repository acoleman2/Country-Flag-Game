//
//  GameManager.swift
//  Country Flag Game
//
//  Created by Ariya Coleman on 1/17/24.
//

import Foundation
import SwiftUI

class GameManager: ObservableObject {
    var questions = [Question]()
    @Published private(set) var index = 0
    @Published private(set) var playingGame = false
    @Published private(set) var answerSelected = false
    @Published private(set) var country = ""
    @Published private(set) var progress: CGFloat = 0.0
    @Published private(set) var score = 0
    
    init() {
        reset
    }
    
    func reset() {
        questions = questions.shuffled()
        index = 0
        score = 0
        progress = 0.0
        playingGame = true
    }
    
    func loadQuestions() {
        let countries = Data().countries
        if countries.count < 4 {
            print("There are only \(countries.count) countries listed in Data (must be atleast 4)")
        }
        else {
            questions.removeAll()
            for country in countries {
                if UIImage(named: country) != nil {
                }
                else {
                    print ("\(country) image cannot be found")
                }
                var incorrectAnswer = [String]()
                while incorrectAnswer.count < 3 {
                    if let randomCountry = countries.randomElement() {
                        if randomCountry != country && !incorrectAnswer.contains(randomCountry) {
                            incorrectAnswer.append(randomCountry)
                        }
                    }
                }
                questions.append(Question(correctAnswer: Answer(text: country, isCorrect: true),
                                          incorrectAnswer: [
                                            Answer(text: incorrectAnswer[0], isCorrect: false),
                                            Answer(text: incorrectAnswer[1], isCorrect: false),
                                            Answer(text: incorrectAnswer[3], isCorrect: false)
                                          ]))
            }
            else {
                print("\(country) imagine cannot be found")
               }
             }
           }
        }
   func goToNextQuestions() {
      if index < questions.count {
          answerSelected = false
          progress = CGFloat(index) / CGFloat(questions.count) * 350.0
          let nextQuestion = questions[index]
          country = nextQuestion.correctAnswer.text
          answerChoices = ([nextQuestion.correctAnswer] + nextQuestion.incorrectAnswer).shuffled()
          index += 1
      }
  }
  func selectAnswer(answer: Answer) {
     answerSelected = true
     if answer.isCorrect {
         score += 1
     }
}