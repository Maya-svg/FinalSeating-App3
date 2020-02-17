//
//  ContentView.swift
//  Seating
//
//  Created by Maya Fenelon on 2/16/20.
//  Copyright © 2020 Maya Fenelon. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var studentName = ""
    @ObservedObject var seatingManager = SeatingManager()
    
    var body: some View {
        VStack{
            HStack{
                Spacer()
                Text("Formal Dinner Seating")
                    .font(.system (size: 35))
                Spacer()
            }
            
            Spacer()
            
            HStack{
                Spacer()
                TextField("Search Name Here", text: $studentName, onCommit: {
                    if self.studentName == "" {
                        //if nothing is typed then user is told to type something
                        self.studentName = "Type Something"
                    }else{
                        self.seatingManager.fetchingTable(name: self.studentName)
                        self.studentName = "" 
                    }
                })
                    .font(.system (size: 25))
                    .border(Color.black, width: 2)
                    .autocapitalization(.words)
                    .aspectRatio(30, contentMode: .fit)
                    .frame(maxWidth: 500, maxHeight: 150)
                
                Spacer()
                
                Button(action: {
                    print("Working")
                    if self.studentName == "" {
                        //if nothing is typed then user is told to type something
                        self.studentName = "Type Something"
                    }else{
                        self.seatingManager.fetchingTable(name: self.studentName)
                        self.studentName = ""
                    }
                }) {
                    Text("Search")
                        .font(.system (size: 30))
                }
                Spacer()
            }
            Spacer()
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
