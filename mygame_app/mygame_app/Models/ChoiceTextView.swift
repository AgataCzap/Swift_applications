//
//  ChoiceTextView.swift
//  mygame_app
//
//  Created by Agata Czap on 20/06/2023.
//to avoid repeating code when creating buttons, create a new separate file

//copy accent colour and text design from the content_view questions file

import SwiftUI

struct ChoiceTextView: View {
    let choiceText: String
    
    var body: some View {
        Text(choiceText)
            .font(.body)
            .bold()
            .multilineTextAlignment(.center)
            .padding()
            .border(GameColor.accent, width: 4)
    }
}


//passed choiceText var into the view
struct ChoiceTextView_Previews: PreviewProvider {
    static var previews: some View {
        ChoiceTextView(choiceText: "Choice Text!")
    }
}
