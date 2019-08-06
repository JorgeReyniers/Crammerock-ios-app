//
//  DateHelper.swift
//  Crammerock-ios-app
//
//  Created by Jorgé Reyniers on 06/08/2019.
//  Copyright © 2019 Jorgé Reyniers. All rights reserved.
//

import Foundation

class DateHelper {
    static func createDate(day: Int, month: Int, year: Int, hour: Int, minutes: Int) -> Date {
        var dateComponents = DateComponents()
        dateComponents.timeZone = TimeZone(abbreviation: "BST")
        dateComponents.day = day
        dateComponents.month = month
        dateComponents.year = year
        dateComponents.hour = hour
        dateComponents.minute = minutes
        let calendar = Calendar.current
        guard let someDate = calendar.date(from: dateComponents) else { return Date() }
        return someDate
    }
    
    static func stringToDate(dateString: String) -> Date {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yyyy HH:mm"
        return formatter.date(from: dateString) ?? Date()
    }
    
    static func dateToString(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yyyy HH:mm"
        return formatter.string(from: date)
    }
    
    static func getTimeString(date:Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        return formatter.string(from:date)
    }
}
