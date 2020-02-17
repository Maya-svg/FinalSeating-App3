//
//  SeatingManager.swift
//  Seating
//
//  Created by Maya Fenelon on 2/16/20.
//  Copyright © 2020 Maya Fenelon. All rights reserved.
//

import Foundation

let Url = "localhost:80" 
//send name and return a dictionary -- a table
// @Published var table = {} //plublish the table dictionaries

struct SeatingData: Decodable {
    let name: String
}

