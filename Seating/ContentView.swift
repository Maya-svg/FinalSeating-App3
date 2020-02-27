import SwiftUI

struct ContentView: View {
    @State var studentName = ""
    @ObservedObject var seatingManager = SeatingManager()
    @State var visual = true
    var newArray = {}
    
    var body: some View {
        NavigationView {
            HStack{
                Spacer()
                //fix the TextField
                TextField("Search Name Here", text: $studentName, onCommit: {
                    if self.studentName == "" {
                        self.studentName = "Type Something"
                    }else{
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
                
                Button(action: {
                    if self.studentName == "" {
                        //if nothing is typed then user is told to type something
                        self.studentName = "Type Something"
                    }else{
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
                NavigationLink(destination: TableView()) {
                    Text("View Table") //move this to middle of app
                }
            )
        }
    }
    
    struct TableView: View{
        @ObservedObject var seatingManager = SeatingManager()
        var body: some View{
            NavigationView{
                VStack{
                    HStack{
                        Spacer()
                        Text(seatingManager.studentName)
                            .font(.system (size: 30))
                        Spacer()
                        Text("Name 2")
                            .font(.system (size: 30))
                        Spacer()
                    }
                    HStack{
                        Spacer()
                        VStack{
                            Text("Name 3")
                                .font(.system (size: 30))
                            Spacer()
                            Text("Name 4")
                                .font(.system (size: 30))
                            Spacer()
                            Text("Name 5")
                                .font(.system (size: 30))
                        }
                        Spacer()
                        ZStack{
                            Circle()
                                .foregroundColor(.blue)
                            Text("TableNumber")
                                .font(.system (size: 30))
                        }
                        VStack{
                            Text("Name 6")
                                .font(.system (size: 30))
                            Spacer()
                            Text("Name 7")
                                .font(.system (size: 30))
                            Spacer()
                            Text("Name 8")
                                .font(.system (size: 30))
                        }
                        Spacer()
                    }
                    HStack{
                        Spacer()
                        Text("Name 9")
                            .font(.system (size: 30))
                        Spacer()
                        Text("Optional Name 10")
                            .font(.system (size: 30))
                        Spacer()
                    }
                    VStack{
                        Spacer()
                        Text("Your waiter is:")
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

