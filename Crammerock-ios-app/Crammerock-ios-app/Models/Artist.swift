//
//  Artist.swift
//  Crammerock-ios-app
//
//  Created by Jorgé Reyniers on 03/08/2019.
//  Copyright © 2019 Jorgé Reyniers. All rights reserved.
//

import Foundation

class Artist {
    var name: String
    var stage: Stage
    var dayOfPerformance: DayOfPerformance
    var startTimeOfPerformance: String
    
    init(name: String, stage: Stage, dayOfPerformance: DayOfPerformance, startTimeOfPerformance: String) {
        self.name = name
        self.stage = stage
        self.dayOfPerformance = dayOfPerformance
        self.startTimeOfPerformance = startTimeOfPerformance
    }
}

enum DayOfPerformance: String {
    case Vrijdag, Zaterdag
}

enum Stage: String {
    case MainNorth = "Main North", MainSouth = "Main South", Club = "Club"
}
