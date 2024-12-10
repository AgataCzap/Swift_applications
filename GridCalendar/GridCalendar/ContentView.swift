//
//  ContentView.swift
//  GridCalendar
//
//  Created by Agata Czap on 12/09/2023.
//

import SwiftUI
import Foundation

struct ContentView: View {
    //define gridItem to create a grid
    //describes layout properties of the grid, different instances, get alignment, size of columns and so on, can create dynamic grid that adjusts with user movement and interaction or orientation of the device
    //inside content view
    
    
    //let layout = [
        //gives 4 columns of fixed width, give min and max length
        //GridItem(.fixed(40)),
        //GridItem(.fixed(40)),
        //GridItem(.fixed(40)),
        //GridItem(.fixed(40)),
        //add flexible option, takes up entire width available
        //adaptive fills in multiple columns and rows, useful for devices
        //GridItem(.flexible(minimum: 40)),
        //GridItem(.adaptive(minimum: 80)
    //]
    
                 let layout = [
                     GridItem(.flexible(minimum: 40)),
                     GridItem(.flexible(minimum: 40)),
                     GridItem(.flexible(minimum: 40)),
                     GridItem(.flexible(minimum: 40)),
                     GridItem(.flexible(minimum: 40)),
                     GridItem(.flexible(minimum: 40)),
                     GridItem(.flexible(minimum: 40))
                 ]

                 
                 
                 
    //use LazyVGrid or Vertical Grid, single fixed row of 40
   //lazy grid structure - constant variable layout that we pass as argument inside
    //iterate through index 0 to n days for January, iterate through Month property
    //which iterates through days array
    //for each day created a capsule with overlay text to show day number
    //lazy grid uses lazy loading, only  loading grid when needed to use, makes app faster
    
    
    var body: some View {
        //add ScrollView to fully see the grid
        ScrollView {
            //pin views while scrolling with LazyVGrid
            //Now you can see the section header view sticks to the top of the screen while you are scrolling through that particular section. This can help create a smooth, intuitive user experience.
            LazyVGrid(columns: layout, pinnedViews: [.sectionHeaders]) {
                //ForEach(year[0].days) {
                // day in Capsule()
                //add Section to separate months
                //can display header of name of the month
                //foreach iterates through all monthd of the year
                ForEach(year, id: \.name) {
                    month in
                    Section(header: Text(verbatim: month.name).font(.headline)) {
                        ForEach(month.days) {
                            dau in Capsule()
                                .overlay(Text("\(day.value)").foregroundColor(.white))
                                .foregroundColor(.blue)
                                .frame(height: 40)
                            
                        }
                    }
                }
            }
        }
    }
}

//define a couple of structures to hold data
//each day will have a unique value
//will iterate through the months instead of days

struct Day: Identifiable {
    let id = UUID()
    let value: Int
}

struct Month {
    //display name of each month so save it into a constant
    let name: String
    let numberofDays: Int
    //will iterate through days
    //number of Days is also a constant as it doesn't change, except February
    var days: [Day]
    
    //initialise, loop for 1 to n of Days
    
    init(name: String, numberofDays: <#T##Int#>) {
        self.name = name
        self.numberOfDays = numberofDays
        self.days = []
        
        for n in 1...numberofDays {
            self.days.append(Day(value: n))
        }
    }
}

//build year structure, will initialise each Month and pass correct number of days for each month

let year = [
    Month(name: "January", numberOfDays: 31),
    Month(name: "February", numberOfDays: 28),
    Month(name: "March", numberOfDays: 31),
    Month(name: "April", numberOfDays: 30),
    Month(name: "May", numberOfDays: 31),
    Month(name: "June", numberOfDays: 30),
    Month(name: "July", numberOfDays: 31),
    Month(name: "August", numberOfDays: 31),
    Month(name: "September", numberOfDays: 30),
    Month(name: "October", numberOfDays: 31),
    Month(name: "November", numberOfDays: 30),
    Month(name: "December", numberOfDays: 31),
]

//horizontal example of the same Grid
var body: some View {
        ScrollView(.horizontal) {
            LazyHGrid(rows: layout, pinnedViews: [.sectionHeaders]) {
                ForEach(year, id: \.name){ month in
                    Section(header: Text(verbatim: month.name).font(.headline)) {
                        ForEach(month.days) { day in
                            Capsule()
                                .overlay(Text("\(day.value)").foregroundColor(.white))
                                .foregroundColor(.blue)
                                .frame(width: 40)
                        }
                    }
                }
            }
        }
    }


//struct ContentView_Previews: PreviewProvider {
//static var previews: some View {
//ContentView()
//}

