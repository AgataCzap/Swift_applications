//
//  Questionview2.swift
//  
//
//  Created by Agata Czap on 01/08/2023.
//

import SwiftUI

struct QuestionView: View {
    //access view modele with EnvironmentObject property wrapper
    @EnvironmentObject var viewModel: GameViewModel
    let question: Question
    
    var body: some View {
        VStack {
          Text(question.questionText)
            .font(.largeTitle)
            .bold()
            .multilineTextAlignment(.leading)
          Spacer()
          HStack {
            ForEach(0..<question.possibleAnswers.count) { answerIndex in
              Button(action: {
                print("Tapped on option with the text: \(question.possibleAnswers[answerIndex])")
              }) {
                ChoiceTextView(choiceText: question.possibleAnswers[answerIndex])
                  //update to show colours if guess is correct or not
                      .background(viewModel.color(forOptionIndex: answerIndex))
              }
                //disable buttons after a guess was made
              .disabled(viewModel.guessWasMade)
            }
          }
            //Now that we have access to the view model in QuestionView, we can update the UI when the user makes a guess. Update the button’s action configuration to tell the view model that a guess was made. Then add a button to the bottom of the view if a guess was made:
            if viewModel.guessWasMade {
                Button (action: {viewModel.displayNextScreen() })
                BottomTextView(str: "Next")
            }
        }
      }
    }

struct Questionview2_Previews: PreviewProvider {
    static var previews: some View {
        //to be able to preview the QuestionView in the Canvas, we need to provide a question value on QuestionView_Previews.
        //Press the Play button in Xcode. Notice the app behaves exactly as it did before but now we have separated out the question view into its own component.
        Questionview2(question: Game().currentQuestion)
    }
}
