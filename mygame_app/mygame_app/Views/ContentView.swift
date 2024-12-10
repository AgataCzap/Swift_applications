//
//  ContentView.swift
//  mygame_app
//
//  Created by Agata Czap on 05/05/2023.
//

import SwiftUI

//changing colour of th background
//colour values include R, G and B amount
let mainColor = Color(red: 20/255, green: 28/255, blue: 58/255)
let accentColor = Color(red: 48/255, green: 105/255, blue: 240/255)
let white = Color(red: 1, green: 1, blue: 1)
//same as red: 255/255 green" 255/255 blue: 255/255

//deleted hello world text and set a view with zstack instead

//Recall from the previous article that a ZStack is used as a container for views that are superimposed on one another and that the last view in the container will be in front of the others.
//allow the colour to fill entire screen so ignore safe aras
struct ContentView {
    var body: some View {
        ZStack {
            mainColor.ignoresSafeArea()
            //        The buttons are horizontally aligned, so they should be put into an HStack. Since the question number, question, and the button HStack are arranged vertically, they should be placed together in a VStack.
            
            //adding text styling such as spacing and font
            //move text up using a Spacer
            VStack {
                Text("1/10")
                    .font(.callout)
                    .multilineTextAlignment(.leading)
                    .padding()
                Text("What was the first computer bug?")
                    .font(.largeTitle)
                    .bold()
                    .multilineTextAlignment(.leading)
                Spacer()
                //            adding Hstack to hold buttons
                HStack {
                    Button(action: {
                        print("Tapped choice 1")
                    },
                           label: { Text("Ant")
                            .font(.body)
                            .bold()
                            .multilineTextAlignment(.center)
                            .padding()
                            .border(accentColor, width: 4)
                    }
                    )
                    Button(action: {
                          print("Tapped on Choice 2")
                      }, label: {
                          Text("Beetle")
                              .font(.body)
                              .bold()
                              .multilineTextAlignment(.center)
                              .padding()
                              .border(accentColor, width: 4)
                      })
                    Button(action: {
                          print("Tapped on Choice 3")
                      }, label: {
                          Text("Moth")
                              .font(.body)
                              .bold()
                              .multilineTextAlignment(.center)
                              .padding()
                              .border(accentColor, width: 4)
                      })
                    Button(action: {
                          print("Tapped on Choice 4")
                      }, label: {
                          Text("Fly")
                              .font(.body)
                              .bold()
                              .multilineTextAlignment(.center)
                              .padding()
                              .border(accentColor, width: 4)
                      })
                    
                }
                
            }
            
        }
        //    made foreground white to make text visible
        .foregroundColor(.white)
        
    }
}
   


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
         ContentView()
    }
}
