//
//  Stage.swift
//  Crammerock-ios-app
//
//  Created by Jorgé Reyniers on 07/08/2019.
//  Copyright © 2019 Jorgé Reyniers. All rights reserved.
//

import Foundation

enum Stage: Int, Codable {
    case MainNorth, MainSouth, Club
    var stringValue: String {
        switch self {
        case .MainNorth:
            return "Main North"
        case .MainSouth:
            return "Main South"
        case .Club:
            return "Club"
        }
    }
}
