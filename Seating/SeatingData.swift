//
//  WeatherData.swift
//  Seating
//
//  Created by Owen Jones on 2/19/20.
//  Copyright © 2020 Maya Fenelon. All rights reserved.
//

import Foundation

struct SeatingData: Codable {
    let student1: Student
    let student2: Student
    let student3: Student
    let student4: Student
    let student5: Student
    let student6: Student
    let student7: Student
    let student8: Student
    let student9: Student
    let student10: Student

}

struct Student: Codable {
    let name: String
    let seating: String
    let isWaiter: String
}
