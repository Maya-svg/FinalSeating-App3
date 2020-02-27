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
    @Published var studentFirstName = "Name 1"
    @Published var studentLastName = "Name 1"
    @Published var studentTable = "Table"
    @Published var studentWaiter = "No"
    
    let url = "http://localhost:80"
    
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
                    print(error!)
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
            let firstName = decodedData.firstName
            let lastName = decodedData.lastName
            let tableAt = decodedData.seating
            let waiting = decodedData.isWaiter
            
            let tableSeating = SeatingModel(firstName: firstName, lastName: lastName, seating: tableAt, waiting: waiting)
            studentFirstName = tableSeating.firstName
            studentLastName = tableSeating.lastName
            studentTable = tableSeating.seating
            studentWaiter = tableSeating.waiting
            
        } catch {
            print(error)
        }
    }
}
