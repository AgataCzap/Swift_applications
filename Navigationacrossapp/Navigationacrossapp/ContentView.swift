//
//  ContentView.swift
//  Navigationacrossapp
//
//  Created by Agata Czap on 10/07/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
              VStack {
                Text("Items in Stock")
                  .font(.title)
                  .padding()
                Spacer()
                // Adding the NavigationLink moves the user to the item screen
                NavigationLink(
                  destination: ItemDetailView(itemName: "Shrimp Chips"),
                  label: {
                    Text("Shrimp Chips")
                  })
                Spacer()
              }
              .navigationTitle(Text("Ligaya's store"))
              .navigationBarTitleDisplayMode(.inline)
            }
          }
        }


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
