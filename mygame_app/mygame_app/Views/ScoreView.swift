//
//  ScoreView.swift
//  
//
//  Created by Agata Czap on 01/08/2023.
//

import SwiftUI

struct ScoreView: View {
    //once we build model for calculating user's scor add it
    let viewModel: ScoreViewModel
    
    var body: some View {

        // You will be structuring your view similar to the GameView.swift with the data organized inside a VStack and contained with a ZStack. Leave the VStack empty for now, set the GameColor to main, set the foreground color to white, and hide the navigation bar
        ZStack {
            GameColor.main.ignoreSafeArea()
            VStack {
                Spacer()
                Text("Final Score:")
                    .font(.body)
                Text("\(viewModel.percentage)%")
                    .font(.system(size:50))
                    .bold()
                    .padding()
                Spacer()
                VStack {
                    //integrate values from score view model and display them
                    Text("\(viewModel.correctGuesses)✅")
                    Text(" \(viewModel.incorrectGuesses)❌")
                } .font(.system(size:30))
                Spacer()
                NavigationLink(
                    desitination: GameView(),
                    label: {
                        BottomTextView(str: "Re-take Quiz")
                    }
                )
        }
            .foregroundColor(.white)
            .navigationBarHidden(true)
    }
        //add link to the final screen
        .background(
            NavigationLink(destination: ScoreView(viewModel:
                                                    ScoreViewModel(correctGuesses: viewModel.correctGuesses,
                                                                  incorrectGuesses)),
                           isActive: .constant(viewModel.gameIsOver),
                           label: {EmptyView()})
}

struct ScoreView_Previews: PreviewProvider {
    static var previews: some View {
        //set some default values to preview final screen
        ScoreView(viewModel: (correctGuesses: 8, incorrectGuesses: 2))
    }
}
