//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by Alessio on 5/5/23.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import Foundation

struct Question {
    
    let text: String
    //Multiple choice questions have multiple answers
    let answers: [String]
    let rightAnswer: String
    
    //Match the new multiple choice quiz data
    init(q: String, a: [String], correctAnswer: String) {
        self.text = q
        self.answers = a
        self.rightAnswer = correctAnswer
    }
}
