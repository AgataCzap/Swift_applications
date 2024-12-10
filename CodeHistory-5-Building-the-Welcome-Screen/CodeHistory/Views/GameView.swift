//
//  ContentView.swift
//  CodeHistory
//
//  Created by Ben Stone on 3/4/21.
//

import SwiftUI

struct GameView: View {
    
    let question = Question(
        questionText: "What was the first computer bug?",
        possibleAnswers: ["Ant", "Beetle", "Moth", "Fly"],
        correctAnswerIndex: 2)
    
    @State var mainColor = GameColor.main
    
    var body: some View {
        ZStack {
            mainColor.ignoresSafeArea()
            VStack {
                VStack {
                    Text("1 / 10")
                        .font(.callout)
                        .multilineTextAlignment(.leading)
                        .padding()
                    Text(question.questionText)
                        .font(.largeTitle)
                        .bold()
                        .multilineTextAlignment(.leading)
                }
                Spacer()
                HStack {
                    ForEach(0..<question.possibleAnswers.count) { answerIndex in
                        Button(action: {
                            print("Tapped on option with the text: \(question.possibleAnswers[answerIndex])")
                            
                            // The line below should be the last thing learners add in this article
                            mainColor = answerIndex == question.correctAnswerIndex ? GameColor.correctGuess : GameColor.incorrectGuess
                        }) {
                            ChoiceTextView(choiceText: question.possibleAnswers[answerIndex])
                        }
                    }
                }
            }
            
        }
        .foregroundColor(.white)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
