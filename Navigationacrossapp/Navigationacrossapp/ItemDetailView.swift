//
//  ItemDetailView.swift
//  Navigationacrossapp
//
//  Created by Agata Czap on 10/07/2023.
//

import Foundation
import SwiftUI
struct ItemDetailView: View {
    //generate rand num to represent number of items in tore
    @State var quantityRemaining = Int.random(in: 1...10)
    let itemName: String
    
    var body: some View {
        VStack {
            Text("\(itemName)")
                .font(.title)
                .padding()
            Spacer()
            Image(systemName: "photo")
                .font(.system(size: 200))
                .padding()
            Text("Quantity Remaining: \(quantityRemaining)")
            Spacer()
            Button {
                //decrement by 1 as added to cart
                //print("Button tapped")
                if quantityRemaining > 0 {
                    quantityRemaining -= 1
                }
            } label: {
                Text("Add one to your cart")
            }
            Spacer()
        }
        .background(
            // .background() runs the view below in the background
            .background(
                // The navigation link is not active until the quantity is 0
                NavigationLink(destination: Text("You bought all the \(itemName)!"),
                               isActive: .constant(quantityRemaining == 0),
                               label: { EmptyView() })
            )
            )
            }
    }
        
struct ItemDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ItemDetailView(itemName: "Test Item")
    }
}
