//
//  Date Formatter.swift
//  Rehab Tracker
//
//  Created by MYMACBOOK on 20.05.2021.
//

import Foundation

func dateFormatter() -> String {
    let date = Date()
    let formatter = DateFormatter()
    formatter.dateFormat = "HH:mm E, d MMM y"
    return formatter.string(from: date)
}
