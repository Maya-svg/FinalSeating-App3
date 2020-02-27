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
                NavigationLink(destination: TableView(seatingManager: self.seatingManager)) {
                    Text("View Table") //move this to middle of app
                }
            )
        }
    }
    
    struct TableView: View{
        
        @ObservedObject var seatingManager: SeatingManager
        //@ObservedObject var seatingManager = SeatingManager()
                
        var body: some View{
            NavigationView{
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
                        ZStack{
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
                        Text(seatingManager.studentWaiter)
                            .font(.system (size: 30))
                        Spacer()
                        Text(seatingManager.student10Name)
                            .font(.system (size: 30))
                        Spacer()
                    }
                    VStack{
                        Spacer()
                        Text("Waiter")
                        Spacer()
                        Text(seatingManager.studentWaiter)
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

