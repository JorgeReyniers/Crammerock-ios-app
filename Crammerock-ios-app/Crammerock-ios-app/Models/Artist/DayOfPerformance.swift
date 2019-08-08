//
//  DayOfPerformance.swift
//  Crammerock-ios-app
//
//  Created by Jorgé Reyniers on 07/08/2019.
//  Copyright © 2019 Jorgé Reyniers. All rights reserved.
//

import Foundation

enum DayOfPerformance: Int, Codable {
    case Vrijdag, Zaterdag
    var stringValue: String {
        switch self {
        case .Vrijdag:
            return "Vrijdag"
        case .Zaterdag:
            return "Zaterdag"
        }
    }
}
