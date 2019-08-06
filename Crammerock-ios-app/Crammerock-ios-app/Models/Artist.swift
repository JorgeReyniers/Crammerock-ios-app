//
//  Artist.swift
//  Crammerock-ios-app
//
//  Created by Jorgé Reyniers on 03/08/2019.
//  Copyright © 2019 Jorgé Reyniers. All rights reserved.
//

import Foundation

class Artist : Codable{
    var name: String
    var stage: Stage
    var dayOfPerformance: DayOfPerformance
    var startTimeOfPerformance: String
    var endTimeOfPerformance: String
    
    static var archiveUrl: URL {
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        return documentsDirectory.appendingPathComponent("artists").appendingPathExtension("plist")
    }
    
    init(name: String, stage: Stage, dayOfPerformance: DayOfPerformance, startTimeOfPerformance: String, endTimeOfPerformance: String) {
        self.name = name
        self.stage = stage
        self.dayOfPerformance = dayOfPerformance
        self.startTimeOfPerformance = startTimeOfPerformance
        self.endTimeOfPerformance = endTimeOfPerformance
    }
    
    static func saveToFile(artists:[Artist]) {
        let propertyListEncoder = PropertyListEncoder()
        let encodedArtists = try? propertyListEncoder.encode(artists)
        
        try? encodedArtists?.write(to: archiveUrl, options: .noFileProtection)
    }
    
    static func loadFromFile() -> [Artist]? {
        let propertyListDecoder = PropertyListDecoder()
        guard let retrievedArtists = try? Data(contentsOf: archiveUrl), let decodedArtists = try? propertyListDecoder.decode(Array<Artist>.self, from: retrievedArtists) else { return nil }
        return decodedArtists
    }
    
    static func loadArtists() -> [Artist] {
        return [Artist(name: "Bazart", stage: .MainSouth, dayOfPerformance: .Vrijdag, startTimeOfPerformance: "00:05", endTimeOfPerformance: "01:20"),
            Artist(name: "Craig David presents TS5", stage: .MainNorth, dayOfPerformance: .Vrijdag, startTimeOfPerformance: "01:25", endTimeOfPerformance: "02:25"),
            Artist(name: "Jungle", stage: .MainNorth, dayOfPerformance: .Vrijdag, startTimeOfPerformance: "20:20", endTimeOfPerformance: "21:20"),
            Artist(name: "The Vaccines", stage: .MainNorth, dayOfPerformance: .Vrijdag, startTimeOfPerformance: "22:45", endTimeOfPerformance: "00:00"),
            Artist(name: "Black Box Revelation", stage: .MainSouth, dayOfPerformance: .Vrijdag, startTimeOfPerformance: "21:25", endTimeOfPerformance:  "22:40"),
            Artist(name: "Jonas Blue", stage: .MainSouth, dayOfPerformance: .Vrijdag, startTimeOfPerformance: "02:30", endTimeOfPerformance: "04:00"),
            Artist(name: "Ronnie Flex & Deuxperience", stage: .MainNorth, dayOfPerformance: .Vrijdag, startTimeOfPerformance: "18:10", endTimeOfPerformance: "19:10"),
            Artist(name: "The Van Jets", stage: .MainSouth, dayOfPerformance: .Vrijdag, startTimeOfPerformance: "19:15", endTimeOfPerformance: "20:15"),
            Artist(name: "Black Leather Jacket", stage: .MainSouth, dayOfPerformance: .Vrijdag, startTimeOfPerformance: "15:35", endTimeOfPerformance: "16:20"),
            Artist(name: "DJ Licious", stage: .Club, dayOfPerformance: .Vrijdag, startTimeOfPerformance: "21:30", endTimeOfPerformance: "23:00"),
            Artist(name: "Joyhauser", stage: .Club, dayOfPerformance: .Vrijdag, startTimeOfPerformance: "00:30", endTimeOfPerformance: "02:00"),
            Artist(name: "Maxim Lany", stage: .Club, dayOfPerformance: .Vrijdag, startTimeOfPerformance: "23:00", endTimeOfPerformance: "00:30"),
            Artist(name: "OT", stage: .Club, dayOfPerformance: .Vrijdag, startTimeOfPerformance: "16:30", endTimeOfPerformance: "17:00"),
            Artist(name: "Stef Kamil Carlens & Band", stage: .MainSouth, dayOfPerformance: .Vrijdag, startTimeOfPerformance: "17:15", endTimeOfPerformance: "18:05"),
            Artist(name: "Stijn Van De Voorde & Thibault Christaensen", stage: .Club, dayOfPerformance: .Vrijdag, startTimeOfPerformance: "02:00", endTimeOfPerformance: "03:30"),
            Artist(name: "Tessa Dixson", stage: .Club, dayOfPerformance: .Vrijdag, startTimeOfPerformance: "17:30", endTimeOfPerformance: "18:15"),
            Artist(name: "The Sherlocks", stage: .MainNorth, dayOfPerformance: .Vrijdag, startTimeOfPerformance: "16:25", endTimeOfPerformance: "17:10"),
            Artist(name: "Uberdope", stage: .MainNorth, dayOfPerformance: .Vrijdag, startTimeOfPerformance: "15:00", endTimeOfPerformance: "15:30"),
            Artist(name: "Warhola", stage: .Club, dayOfPerformance: .Vrijdag, startTimeOfPerformance: "20:00", endTimeOfPerformance: "21:00"),
            Artist(name: "Yung Felix", stage: .Club, dayOfPerformance: .Vrijdag, startTimeOfPerformance: "18:30", endTimeOfPerformance: "19:30"),
            Artist(name: "Balthazar", stage: .MainSouth, dayOfPerformance: .Zaterdag, startTimeOfPerformance: "23:25", endTimeOfPerformance: "00:40"),
            Artist(name: "Goose", stage: .MainNorth, dayOfPerformance: .Zaterdag, startTimeOfPerformance: "00:45", endTimeOfPerformance: "02:00"),
            Artist(name: "Skunk Anansie", stage: .MainNorth, dayOfPerformance: .Zaterdag, startTimeOfPerformance: "22:05", endTimeOfPerformance: "23:20"),
            Artist(name: "Dean Lewis", stage: .MainSouth, dayOfPerformance: .Zaterdag, startTimeOfPerformance: "21:00", endTimeOfPerformance: "22:00"),
            Artist(name: "Enter Shikari", stage: .MainNorth, dayOfPerformance: .Zaterdag, startTimeOfPerformance: "19:55", endTimeOfPerformance: "20:55"),
            Artist(name: "K's Choice", stage: .MainSouth, dayOfPerformance: .Zaterdag, startTimeOfPerformance: "18:50", endTimeOfPerformance: "19:50"),
            Artist(name: "Lil Kleine", stage: .MainSouth, dayOfPerformance: .Zaterdag, startTimeOfPerformance: "17:05", endTimeOfPerformance: "17:50"),
            Artist(name: "SaSaSaS", stage: .Club, dayOfPerformance: .Zaterdag, startTimeOfPerformance: "00:00", endTimeOfPerformance: "01:00"),
            Artist(name: "Whispering Sons", stage: .MainNorth, dayOfPerformance: .Zaterdag, startTimeOfPerformance: "17:55", endTimeOfPerformance: "18:45"),
            Artist(name: "Ares", stage: .Club, dayOfPerformance: .Zaterdag, startTimeOfPerformance: "16:15", endTimeOfPerformance: "17:00"),
            Artist(name: "Black Mamba", stage: .Club, dayOfPerformance: .Zaterdag, startTimeOfPerformance: "21:15", endTimeOfPerformance: "22:45"),
            Artist(name: "DJ Yolotanker", stage: .Club, dayOfPerformance: .Zaterdag, startTimeOfPerformance: "01:00", endTimeOfPerformance: "02:00"),
            Artist(name: "Frenna", stage: .Club, dayOfPerformance: .Zaterdag, startTimeOfPerformance: "15:40", endTimeOfPerformance: "16:10"),
            Artist(name: "Gestapo Knallmuzik", stage: .MainSouth, dayOfPerformance: .Zaterdag, startTimeOfPerformance: "13:45", endTimeOfPerformance: "14:30"),
            Artist(name: "Glints", stage: .Club, dayOfPerformance: .Zaterdag, startTimeOfPerformance: "19:35", endTimeOfPerformance: "20:20"),
            Artist(name: "IBE", stage: .MainNorth, dayOfPerformance: .Zaterdag, startTimeOfPerformance: "14:35", endTimeOfPerformance: "15:20"),
            Artist(name: "K1D", stage: .Club, dayOfPerformance: .Zaterdag, startTimeOfPerformance: "18:45", endTimeOfPerformance: "19:30"),
            Artist(name: "Kanine", stage: .Club, dayOfPerformance: .Zaterdag, startTimeOfPerformance: "22:45", endTimeOfPerformance: "00:00"),
            Artist(name: "Leafs", stage: .Club, dayOfPerformance: .Zaterdag, startTimeOfPerformance: "15:05", endTimeOfPerformance: "15:35"),
            Artist(name: "Miss Angel", stage: .Club, dayOfPerformance: .Zaterdag, startTimeOfPerformance: "17:55", endTimeOfPerformance: "18:40"),
            Artist(name: "SONS", stage: .MainNorth, dayOfPerformance: .Zaterdag, startTimeOfPerformance: "16:15", endTimeOfPerformance: "17:00"),
            Artist(name: "Sports Team", stage: .MainSouth, dayOfPerformance: .Zaterdag, startTimeOfPerformance: "15:25", endTimeOfPerformance: "16:10"),
            Artist(name: "StuBru Partysquad", stage: .MainSouth, dayOfPerformance: .Zaterdag, startTimeOfPerformance: "02:05", endTimeOfPerformance: "04:00"),
            Artist(name: "The Blockparty", stage: .Club, dayOfPerformance: .Zaterdag, startTimeOfPerformance: "14:30", endTimeOfPerformance: "15:00"),
            Artist(name: "Woodie Smalls", stage: .Club, dayOfPerformance: .Zaterdag, startTimeOfPerformance: "20:25", endTimeOfPerformance: "21:10"),
            Artist(name: "Yung Mavu", stage: .Club, dayOfPerformance: .Zaterdag, startTimeOfPerformance: "17:05", endTimeOfPerformance: "17:50")]
    }
}

enum DayOfPerformance: String, Codable {
    case Vrijdag, Zaterdag
}

enum Stage: String, Codable {
    case MainNorth = "Main North", MainSouth = "Main South", Club
}
