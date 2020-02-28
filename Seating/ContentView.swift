import SwiftUI

struct ContentView: View {
    @State var studentName = ""
    @ObservedObject var seatingManager = SeatingManager()
    
    var body: some View {
        NavigationView {
            HStack{
                Spacer()
// Code for the TextField
                TextField("Search Name Here", text: $studentName, onCommit: {
                    // user is told to write something in the textfield if the studentName variable is empty
                    if self.studentName == "" {
                        self.studentName = "Type Something"
                    }else{
                        //if a name is written it is used to create the url through the fetchTable function in the seatingManager.
                        self.seatingManager.fetchTable(name: self.studentName)
                        self.studentName = ""
                    }
                })
                    .font(.system (size: 25))
                    .border(Color.black, width: 2)
                    .autocapitalization(.words)
                    .aspectRatio(30, contentMode: .fit)
                    .frame(maxWidth: 500, maxHeight: 150)
                Spacer()

// Code for search button
                Button(action: {
                    if self.studentName == "" {
                        // user is told to write something in the textfield if the studentName variable is empty
                        self.studentName = "Type Something"
                    }else{
                        // clicking the search button sends the typed name to the fetchTable function in the seatingManager.
                        self.seatingManager.fetchTable(name: self.studentName)
                        self.studentName = ""
                    }
                }) {
                    Text("Search")
                        .font(.system (size: 30))
                }
                Spacer()
            }
            .navigationBarTitle(Text("Formal Dinner Seating"))
            .font(.system (size: 50))
            .navigationBarItems(trailing:
                // The NavigationLink changes the view from the homescreen to the table viewing screen
                NavigationLink(destination: TableView(seatingManager: self.seatingManager)) {
                    Text("View Table") //move this to middle of app
                }
            )
        }
    }
    
    struct TableView: View{
        // Code for the second screen view--- where you see all the people at your table
        @ObservedObject var seatingManager: SeatingManager
        
        var body: some View{
            NavigationView{
              // below is the arrangement of all the people at the formal table.
                VStack{
                    HStack{
                        Spacer()
                        Text((seatingManager.student1Name))
                            .font(.system (size: 30))
                        Spacer()
                        Text(seatingManager.student2Name)
                            .font(.system (size: 30))
                       Spacer()
                    }
                    HStack{
                        Spacer()
                        VStack{
                            Text(seatingManager.student3Name)
                                .font(.system (size: 30))
                            Spacer()
                            Text(seatingManager.student4Name)
                                .font(.system (size: 30))
                            Spacer()
                            Text(seatingManager.student5Name)
                                .font(.system (size: 30))
                        }
                        Spacer()
                        ZStack{ //the table number is written in this ZStack
                            Circle()
                                .foregroundColor(.blue)
                            Text(seatingManager.studentTable)
                                .font(.system (size: 30))
                        }
                        VStack{
                            Text(seatingManager.student6Name)
                                .font(.system (size: 30))
                            Spacer()
                            Text(seatingManager.student7Name)
                                .font(.system (size: 30))
                            Spacer()
                            Text(seatingManager.student8Name)
                                .font(.system (size: 30))
                        }
                        Spacer()
                    }
                    HStack{
                        Spacer()
                        Text(seatingManager.student10Name)
                            .font(.system (size: 30))
                        Spacer()
                    }
                    VStack{
                        Spacer()
                        // the waiter of the table is written here
                        Text("Waiter: ")
                            .font(.system (size: 30))
                        Text(seatingManager.studentWaiter)
                            .font(.system (size: 30))
                        Spacer()
                        Text("Enjoy Your Meal!")
                            .font(.system (size: 30))
                        Spacer()
                    }
                    Spacer()
                }
            }
        }
    }
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}

