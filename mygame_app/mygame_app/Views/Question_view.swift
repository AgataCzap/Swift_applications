//
//  Question_view.swift
//  mygame_app
//
//  Created by Agata Czap on 20/06/2023.
//

import SwiftUI

//declaring question and possible answers as an array
//creating question using layout in question.swift
//structing user view
struct Question_view:  View {
    let question = Question(questionText: "What was the first computer bug?", possibleAnswers: ["Ant", "Beetle", "Moth", "Fly"], correctAnswersIndex: 2)
    //added state property to main colour to allow it to change with user interaction
    @State var mainColor = Color(red: 20/255, green: 28/255, blue: 58/255)
    let accentColor = Color(red: 48/255, green: 105/255, blue: 240/255)
    var body: some View {
        ZStack {
            mainColor.ignoresSafeArea()
            VStack {
                Text("1/10")
                    .font(.callout)
                    .multilineTextAlignment(.leading)
                    .padding()
                Text(question.questionText)
                    .font(.largeTitle)
                    .bold()
                    .multilineTextAlignment(.leading)
                
            }
        }
        //now creating buttons to select answers
        //removed excessive code and added styling from ChoiceTextView
        HStack {
            Button(action: {
              print("Tapped on Choice 1")
            }, label: {
                ChoiceTextView(choiceText: question.possibleAnswers[0])
            })
            Button(action: {
              print("Tapped on Choice 2")
            }, label: {
                ChoiceTextView(choiceText: question.possibleAnswers[1])
            })
            Button(action: {
              print("Tapped on Choice 3")
            }, label: {
                ChoiceTextView(choiceText: question.possibleAnswers[2])
            })
            Button(action: {
              print("Tapped on Choice 4")
            }, label: {
                ChoiceTextView(choiceText: question.possibleAnswers[3])
            })
        }
    }
}

//ForEach loop is a swift loop that goes through a collection of data
//and creates a corresponding view for each element
//replace content in Hstack
///Right now our application presents a question to the user with a list of tappable answers. But, nothing changes on the screen when the user makes a selection. We print the answer text to the console but that is invisible to the user. It would be nice to indicate a correct or incorrect choice. A very important aspect of mobile development is responsive feedback to keep the user engaged.//
///We will change the background color of the app to green when the user taps on the correct answer, and red when they select an incorrect answer
///adding state to allow mainColor to change depending on user interaction
/// In our case, we want SwiftUI to update all of our views whenever the mainColor property changes (like when the user taps one of the buttons).

//This is the essence of declarative UI. The SwiftUI framework handles updating the screen for us whenever there is a change to an underlying property rather than explicitly telling the screen to update whenever a change occurs. This is one of the main differences between UIKit (imperative) and SwiftUI (declarative).

HStack {
    ForEach(0...<question.possibleAnswers.count) { answerIndex in
        //define view that will be returned for each index
        //answerIndex is a placeholer
        Button(action: {
            print(("Tapped on option with text: quetion.possibleAnswers[answerIndex]"))
            mainColor = answerIndex == question.correctAnswersIndex ? .green: .red
        }, label: {
            ChoiceTextView(choiceText: question.possibleAnswerss[answerIndex])
        }
        )
    }
    
    
    
    
    
    
    
    
    struct Question_view_Previews: PreviewProvider {
        static var previews: some View {
            Question_view()
        }
    }
    
}
