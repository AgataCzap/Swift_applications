//
//  Game.swift
//  mygame_app
//
//  Created by Agata Czap on 04/07/2023.
//

import Foundation
//creating game structure to hold game model
//group into new folder Models File-New-Group
//to tract number of guesses made per question use Dictionary
//map question object to answer index selected by the user
//have to make question structure hashable
//The Game model is coming together very elegantly. It keeps certain information private and provides an interface that enforces rules for interacting with that private state. A program that uses this Game structure won’t be able to access this internal state directly and will need to use the accessible methods for reading and mutating data instead. //
//methods create a program's API - Application Programming Interface
//API describves how 2 programs or component can interact with each other
//When designing a structure’s API, it’s important to consider what data or functionality another structure would want from it.

struct Game {
    //add vairable to keep track of the current quetion, default index 0
    privat(set) var currentQuestionIndex = 0
    //add property guesses, reads property Question but does not modify it
    private(set) var guesses = [Question: Int]()
    //set property to determine if Game is over, default is false
    private(set) var isOver = false
    //call quesstions and randomise them with shuffled(), retrieve the array
    private let questions = Question.allQuestions.shuffled()
    
    //guess count property that iterates through guesses dictionary
    //and calculates total number of guessses
    //returns tuplee containing total num of correct guesses and incorrect
    //guess is correct if its index is same as correctAnswerIndex
    //iteerates through guessed dictionary and map which questions have correct answer index
    //if guess correct then count.correct + 1 else count.incorrect + 1
    //once loop finished, tuple will contain all guesses
    var guessCount: (correct: Int, incorrect: Int) {
        var count: (correct: Int, incorrect: Int) = (0,0)
        for (question, guessedIndex) in guesses {
            if question.correctAnswerIndex == guessedIndex {
                count.correct += 1
            } else {
                count.incorrect += 1
            }
        }
        return count
    }
    
    //computed properpties that derive values from other properties
    //create property to keep track of total number of question
    var numberOfQuestions: Int {
        questions.count
    }
    //create var to display current question
    var currentQuestion: Question {
        questions[currentQuestionIndex]
    }

    
    //making private method that will update guesses index for a specific question
    //will change the internal state of the structure so must be mutating
    mutating func makeGuessForCurrentQuestion(atIndex index: Int) {
        guesses[currentQuestion] = index
    }

    //add provate function to update game status
    //changes guestion index by 1 as you proceed to the next question
    //if no more questions left it will change isOver to true
    mutating func updateGameStatus() {
        if currentQuestionIndex < questions.count - 1 {
            currentQuestionIndex += 1
        } else {
            isOver = true
        }
    }
}
