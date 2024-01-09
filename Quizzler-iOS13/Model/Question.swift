//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by vpn on 01/07/21.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import Foundation

struct Question {
    var question : String
    var answer : [String]
    var correctAnswer: String
    
    
    init(q: String, a: [String], correctAnswer: String) {
        question = q
        answer = a
        self.correctAnswer = correctAnswer
    }
    
    
}
