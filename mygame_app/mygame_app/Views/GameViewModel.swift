//
//  GameViewModel.swift
//  mygame_app
//
//  Created by Agata Czap on 10/07/2023.
//GameViewModel that conforms to the ObservableObject protocol. The view model will emit events when changes are made to its Published properties, namely game. We add a property named game of type Game. This is wrapped in the @Published modifier so our GameViewModel can notify any observers when changes are made to it like when a user makes a guess. A computed variable named currentQuestion. This returns the game’s current question. A variable named questionProgressText that returns the String to be displayed at the top of the screen to indicate the user’s progress.

import Foundation
import SwiftUI
 
// 1
class GameViewModel: ObservableObject {
 
  // MARK: - Published properties
  // 2
  @Published private var game = Game()
 
  // MARK: - Internal properties
  // 3
  var currentQuestion: Question {
     game.currentQuestion
  }
  // 4
  var questionProgressText: String {
      //add functionality to GameViewModel to handle user's guesses
    //guessWasMade checks game.guesses for a value. If a value is found we know the user has made a guess at the question. We can check this value in our GameView to show a button that will allow the user to move to the next screen.
      var guessWasMade: Bool {
          if let _ = game.guesses[currentQuestion] {
              return true
          } else {
              return false
          }
      }
      //add a new Bool called gameIsOver that returns the isOver value from game:
      //You will use the gameIsOver property to navigate to the final view that displays the quiz results. This navigation will take place in the GameView.swift file. Open that file now to set up your navigation.
      var gameIsOver: Bool {
          game.isOver
      }
      
      //add new variables to store results of the player for the final screen
      var correctGuesses: Int {
          game.guessCount.correct
      }
      
      var incorrectGuesses: Int {
          game.guessCount.incorrect
      }
      
      //mark internal methods
      // makeGuess(atIndex index: Int) simply communicates the guessed index to the game game property for the currently displayed question.
      func makeGuess(atIndex index: Int) {
          game.makeGuessforCurrentQuestion(atIndex: index)
      }
      //displayNextScreen() will update the game’s status and will be called when the user taps on the button to proceed to the next screen.
      func displayNextScreen() {
          game.updateGameStatus()
      }
    //"\(game.currentQuestionIndex + 1) / \(game.numberOfQuestions)"
      //Now the user will no longer see the Back button in the upper left corner. Next, let’s update the selected color when the user taps a button. To do this we are going to add a function to our view model that takes an index and returns a color.
      func color(forOptionIndex optionIndex: Int) -> Color {
          if let guessedIndex = game.guesses[currentQuestion] {
              if guessedIndex != optionIndex {
                  return GameColor.main
              } else if guessedIndex ==
                            currentQuestion.correctAnswerIndex {
                  return GameColor.correctGuess
              } else {
                  retun GameColor.incorrectGuess
          }
          } else {
              return GameColor.main
          }
      }
  }
}
//The color function takes an index as its parameter and returns a Color. We use conditional binding to check if the user has made a guess. If so, we use that index to determine if guessedIndex matches currrentQuestion.correctAnswerIndex. If it does, return GameColor.correctGuess. If not, return GameColor.incorrectGuess. And if guessedIndex does not match the passed in optionIndex return GameColor.main. Finally, if no guess has been made, return GameColor.main. This will allow us to highlight the background color of ChoiceTextView when the user makes a guess.

