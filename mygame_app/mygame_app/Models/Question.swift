//
//  Questions.swift
//  mygame_app
//
//  Created by Agata Czap on 20/06/2023.
//added more questions inside question structure
//make Question structure hashable, produces hash value if passed through hashing algorithm
//make structure hashable so that you can use it as key in Dictionary


import Foundation

struct Question: Hashable {
    let questionText: String
    let possibleAnswers: [String]
    let correctAnswerIndex: Int
        
        static var AllQuestions = [
            Question(questionText: "Who invented the World Wide Web?",
                     possibleAnswers: [
                        "Bill Gates",
                        "Linus Torvalds",
                        "Bill Gates",
                        "Tim Berners-Lee"],
                     correctAnswersIndex: 3),
            Question(questionText: "What was the first object oriented programming language?", possibleAnswers: [
                "Simula",
                "Python",
                "Swift",
                "C"], correctAnswersIndex: 0)
        ]
    }
}
