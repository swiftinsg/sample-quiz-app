//
//  QuizQuestion.swift
//  Quiz Speedrun
//
//  Created by YJ Soon on 16/6/22.
//

import Foundation

struct QuizQuestion {
    
    // These make up the quiz question: title and four option strings.
    var questionTitle: String
    var option1Title: String
    var option2Title: String
    var option3Title: String
    var option4Title: String
    
    var correctOption: Option

    // You can define an enum inside a struct, if it's only
    // going to be used by this struct.
    // Access it as QuizQuestion.Option
    enum Option {
        case option1, option2, option3, option4
    }
    
}
