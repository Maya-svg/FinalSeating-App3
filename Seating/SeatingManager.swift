//
//  SeatingManager.swift
//  Seating
//
//  Created by Maya Fenelon on 2/16/20.
//  Copyright © 2020 Maya Fenelon. All rights reserved.
//
//Goal: send someone's name to localhost:80 and return their table (a dictionary)

/*
 TODO:
 - Make Swift able to unmarshal JSON by telling it the key names
 - Error handling:
    - Python needs to see if there's gonna be an error and return an error message
    - Swift needs to check if it received an error and print it accordingly.
 */
import Foundation

class SeatingManager: ObservableObject {
    @Published var student1Name = "Name 1"
    @Published var student2Name = "Name 2"
    @Published var student3Name = "Name 3"
    @Published var student4Name = "Name 4"
    @Published var student5Name = "Name 5"
    @Published var student6Name = "Name 6"
    @Published var student7Name = "Name 7"
    @Published var student8Name = "Name 8"
    @Published var waiterName = "Name 9"
    @Published var student10Name = "Name 10"
    @Published var studentTable = "Table"
    @Published var studentWaiter = "No"
    
    let url = "http://ec2-54-153-13-70.us-west-1.compute.amazonaws.com"
    
    func fetchTable(name: String){
        let urlSafeSearchName = name.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)
        //inputs that new variable into the official url string
        let urlString = "\(url)/\(urlSafeSearchName!)" // cityName is self.locationName
        //url is then used to search for the weather at that location
        performRequest(with: urlString)
        print(urlString) 
    }
    
    func performRequest (with urlString: String){
        // these are the 4 steps to NETWORKING
        //(sending information elsewhere and retriving the results)
        // Step 1. creates an (optional) url ---this is a structure
        if let url = URL(string: urlString){
            // step 2. create a URL session
            //like a browser --- it has the ability to process the url
            let session = URLSession(configuration: .default)
            //step3. give the sesion a task
            //uses the url is the one we just completed
            let task = session.dataTask(with: url) /*takes a function as an input*/ { ( data, response, error)  in //this is a closure
                // the task triggers this function --- if there is a problem we are notified.
                if error != nil {
                    print("Error with GET: \(error!)")
                    return // stops fuction
                }
                //checks the data we got back
                if let safeData = data{
                self.parseJSON(seatingData: safeData)
                    //(safeData turns into a string) let dataString = String(data: safeData, encoding: .utf8) utf8 is the format of the data we get back from the web
                }
            } //returns a task --- means grabbing the information from the website and bringing it back
            //step 4. Start the task
            task.resume() //this starts the task
        }
    }
    func parseJSON(seatingData: Data){
        let decoder = JSONDecoder()
        do {
            let decodedData =  try decoder.decode(SeatingData.self, from: seatingData)
            let name1 = decodedData.student1.name
            let name2 = decodedData.student2.name
            let name3 = decodedData.student3.name
            let name4 = decodedData.student4.name
            let name5 = decodedData.student5.name
            let name6 = decodedData.student6.name
            let name7 = decodedData.student7.name
            let name8 = decodedData.student8.name
            let name9 = decodedData.student9.name
            let name10 = decodedData.student10.name
            let tableAt = decodedData.student1.seating
            DispatchQueue.main.async {
                    let tableSeating = SeatingModel(student1: name1, student2: name2, student3: name3, student4: name4, student5: name5, student6: name6, student7: name7, student8: name8, waiter: name9, student10: name10, table: tableAt)
                    self.student1Name = tableSeating.student1
                    self.student2Name = tableSeating.student2
                    self.student3Name = tableSeating.student3
                    self.student4Name = tableSeating.student4
                    self.student5Name = tableSeating.student5
                    self.student6Name = tableSeating.student6
                    self.student7Name = tableSeating.student7
                    self.student8Name = tableSeating.student8
                    self.student10Name = tableSeating.student10
                    self.studentTable = tableSeating.table
                    self.studentWaiter = tableSeating.waiter
                
                print("Updated studentnNames!")
            }
            
        } catch {
            print("JSON decode \(error)")
        }
    }
}
