//
//  Questions.swift
//  Country Flag Game
//
//  Created by Ariya Coleman on 1/9/24.
//

import Foundation

struct Answer: Identifiable {
    var id = UUID()
    var text: String
    var isCorrect: Bool
}
struct Question: Identifiable {
    var id = UUID()
    var correctAnswer: Answer
    var incorrectAnswer: [Answer]
}
