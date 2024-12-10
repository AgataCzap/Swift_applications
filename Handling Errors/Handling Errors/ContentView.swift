//
//  ContentView.swift
//  Handling Errors
//
//  Created by Agata Czap on 15/06/2023.
//

import SwiftUI

struct ContentView: View {

        var variousGreetings = ["Bonjour", "Konnichiwa", "Jambo"]
        var body: some View {
            let greeting1 = variousGreetings[0]
            let greeting2 = variousGreetings[1]
            let greeting3 = variousGreetings[2]
            let greeting4 = variousGreetings[3]
            
            VStack {
                Text(greeting1)
                Text(greeting2)
                Text(greeting3)
                Text(greeting4)
            }
        }
        
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }

