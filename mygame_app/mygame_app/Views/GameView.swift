//
//  GameView.swift
//  
//
//  Created by Agata Czap on 01/08/2023.
//

import SwiftUI



struct GameView: View {
    //change main Color property
    let question = Question(
        questionText: "What was the first computer bug?",
    possibleAnswers: ["Ant", "Beetle", "Moth", "Fly"],
    correctAnswerIndex: 2)
    //wrap in state object
    @StateObject var viewModel = GameViewModel()
    var body: some View {
        Zstack {
        }
        //Here, you’ll use the .background() modifier to add a NavigationLink that will transition to the final screen automatically once the game is over. Add the following to your ZStack in the GameView:
        .background(NavigationLink(destination: Text("Game Over!"),
                                   isActive:
                .constant(viewModel.gameIsOver),
                                   label: { EmptyView())
        //reference colour here
            GameColor.main.ignoreSafeArea()
            Vstack {
                VStack {
                Text(viewModel.questionProgressText)
                    .font(.callout)
                    .multipleTextAlignment(.leading)
                    .padding()
                    Text(question.questionText)
                        .font(.largeTitle)
                        .bold()
                        .multilineTextAlignment(.leading)
            }
                Spacer()
                HStack {
                    ForEach(0..<question.possibleAnswers.count) }
                answerIndex in
                Button( action: {
                    print("Tapped on option with the text: \(question.possibleAnswers[answerIndex])")
                }
               }
             }
           }
         }
         .foregroundColor(.white)
       }
     }
//after adding this to QuestionView replace with
                        struct GameView: View {
                         
                          @StateObject var viewModel = GameViewModel()
                         
                          var body: some View {
                            ZStack {
                              GameColor.main.ignoresSafeArea()
                              VStack {
                                Text(viewModel.questionProgressText)
                                  .font(.callout)
                                  .multilineTextAlignment(.leading)
                                  .padding()
                                QuestionView(question: viewModel.currentQuestion)
                              }
                            }
                            .foregroundColor(.white)
                              //hide navigation buttons to previous questions and if thee guess was correect
                            .navigationBarHidden(true)
                              //Now we have methods on our GameViewModel that will help progress the user through the quiz. We can use these to show a button at the bottom of the screen after the user guesses an answer. But to do that, we need access to the view model in our QuestionView. We can do just that with an EnvironmentObject.
                            .environmentObjct(viewModel)
                          }
                        }
                        
//This cleans up nicely! Since we are using the question from the view model, the hard-coded question property is no longer needed. Then, we replace the question logic with our QuestionView and initialize it with the viewModel.currentQuestion. Now all of the logic related to displaying the question and its buttons lives within QuestionView. The GameView is more concise, simpler, and easier to reason about.//
                        
                        
struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
//run, app looks the same, background colour does not change when the answer is sleected,
