//
//  Artist.swift
//  Crammerock-ios-app
//
//  Created by Jorgé Reyniers on 03/08/2019.
//  Copyright © 2019 Jorgé Reyniers. All rights reserved.
//

import Foundation

struct Artist : Codable{
    var name: String
    var stage: Stage
    var dayOfPerformance: DayOfPerformance
    var startDateTimeOfPerformance: Date
    var endDateTimeOfPerformance: Date
    var artistDetails: ArtistDetails?
    
    static var archiveUrl: URL {
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        return documentsDirectory.appendingPathComponent("artists").appendingPathExtension("plist")
    }
    
    init(name: String, stage: Stage, dayOfPerformance: DayOfPerformance, startDateTimeOfPerformance: Date, endDateTimeOfPerformance: Date) {
        self.name = name
        self.stage = stage
        self.dayOfPerformance = dayOfPerformance
        self.startDateTimeOfPerformance = startDateTimeOfPerformance
        self.endDateTimeOfPerformance = endDateTimeOfPerformance
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
        return [
            Artist(name: "Bazart", stage: .MainSouth, dayOfPerformance: .Vrijdag, startDateTimeOfPerformance: DateHelper.createDate(day: 7, month: 9, year: 2019, hour: 00, minutes: 05), endDateTimeOfPerformance: DateHelper.createDate(day: 7, month: 9, year: 2019, hour: 01, minutes: 20)),
            Artist(name: "Craig David presents TS5", stage: .MainNorth, dayOfPerformance: .Vrijdag, startDateTimeOfPerformance: DateHelper.createDate(day: 7, month: 9, year: 2019, hour: 01, minutes: 25), endDateTimeOfPerformance: DateHelper.createDate(day: 7, month: 9, year: 2019, hour: 02, minutes: 25)),
            Artist(name: "Jungle", stage: .MainNorth, dayOfPerformance: .Vrijdag, startDateTimeOfPerformance: DateHelper.createDate(day: 6, month: 9, year: 2019, hour: 20, minutes: 20), endDateTimeOfPerformance: DateHelper.createDate(day: 6, month: 9, year: 2019, hour: 21, minutes: 20)),
            Artist(name: "The Vaccines", stage: .MainNorth, dayOfPerformance: .Vrijdag, startDateTimeOfPerformance: DateHelper.createDate(day: 6, month: 9, year: 2019, hour: 22, minutes: 45), endDateTimeOfPerformance: DateHelper.createDate(day: 7, month: 9, year: 2019, hour: 00, minutes: 00)),
            Artist(name: "Black Box Revelation", stage: .MainSouth, dayOfPerformance: .Vrijdag, startDateTimeOfPerformance: DateHelper.createDate(day: 6, month: 9, year: 2019, hour: 21, minutes: 25), endDateTimeOfPerformance:  DateHelper.createDate(day: 6, month: 9, year: 2019, hour: 22, minutes: 40)),
            Artist(name: "Jonas Blue", stage: .MainSouth, dayOfPerformance: .Vrijdag, startDateTimeOfPerformance: DateHelper.createDate(day: 7, month: 9, year: 2019, hour: 02, minutes: 30), endDateTimeOfPerformance: DateHelper.createDate(day: 7, month: 9, year: 2019, hour: 04, minutes: 00)),
            Artist(name: "Ronnie Flex & Deuxperience", stage: .MainNorth, dayOfPerformance: .Vrijdag, startDateTimeOfPerformance: DateHelper.createDate(day: 6, month: 9, year: 2019, hour: 18, minutes: 10), endDateTimeOfPerformance: DateHelper.createDate(day: 6, month: 9, year: 2019, hour: 19, minutes: 10)),
            Artist(name: "The Van Jets", stage: .MainSouth, dayOfPerformance: .Vrijdag, startDateTimeOfPerformance: DateHelper.createDate(day: 6, month: 9, year: 2019, hour: 19, minutes: 15), endDateTimeOfPerformance: DateHelper.createDate(day: 6, month: 9, year: 2019, hour: 20, minutes: 15)),
            Artist(name: "Black Leather Jacket", stage: .MainSouth, dayOfPerformance: .Vrijdag, startDateTimeOfPerformance: DateHelper.createDate(day: 6, month: 9, year: 2019, hour: 15, minutes: 35), endDateTimeOfPerformance: DateHelper.createDate(day: 6, month: 9, year: 2019, hour: 16, minutes: 20)),
            Artist(name: "DJ Licious", stage: .Club, dayOfPerformance: .Vrijdag, startDateTimeOfPerformance: DateHelper.createDate(day: 6, month: 9, year: 2019, hour: 21, minutes: 30), endDateTimeOfPerformance: DateHelper.createDate(day: 6, month: 9, year: 2019, hour: 23, minutes: 00)),
            Artist(name: "Joyhauser", stage: .Club, dayOfPerformance: .Vrijdag, startDateTimeOfPerformance: DateHelper.createDate(day: 7, month: 9, year: 2019, hour: 00, minutes: 30), endDateTimeOfPerformance: DateHelper.createDate(day: 7, month: 9, year: 2019, hour: 02, minutes: 00)),
            Artist(name: "Maxim Lany", stage: .Club, dayOfPerformance: .Vrijdag, startDateTimeOfPerformance: DateHelper.createDate(day: 6, month: 9, year: 2019, hour: 23, minutes: 00), endDateTimeOfPerformance: DateHelper.createDate(day: 7, month: 9, year: 2019, hour: 00, minutes: 30)),
            Artist(name: "OT", stage: .Club, dayOfPerformance: .Vrijdag, startDateTimeOfPerformance: DateHelper.createDate(day: 6, month: 9, year: 2019, hour: 16, minutes: 30), endDateTimeOfPerformance: DateHelper.createDate(day: 6, month: 9, year: 2019, hour: 17, minutes: 00)),
            Artist(name: "Stef Kamil Carlens & Band", stage: .MainSouth, dayOfPerformance: .Vrijdag, startDateTimeOfPerformance: DateHelper.createDate(day: 6, month: 9, year: 2019, hour: 17, minutes: 15), endDateTimeOfPerformance: DateHelper.createDate(day: 6, month: 9, year: 2019, hour: 18, minutes: 05)),
            Artist(name: "Stijn Van De Voorde & Thibault Christaensen", stage: .Club, dayOfPerformance: .Vrijdag, startDateTimeOfPerformance: DateHelper.createDate(day: 7, month: 9, year: 2019, hour: 02, minutes: 00), endDateTimeOfPerformance: DateHelper.createDate(day: 7, month: 9, year: 2019, hour: 03, minutes: 30)),
            Artist(name: "Tessa Dixson", stage: .Club, dayOfPerformance: .Vrijdag, startDateTimeOfPerformance: DateHelper.createDate(day: 6, month: 9, year: 2019, hour: 17, minutes: 30), endDateTimeOfPerformance: DateHelper.createDate(day: 6, month: 9, year: 2019, hour: 18, minutes: 15)),
            Artist(name: "The Sherlocks", stage: .MainNorth, dayOfPerformance: .Vrijdag, startDateTimeOfPerformance: DateHelper.createDate(day: 6, month: 9, year: 2019, hour: 16, minutes: 25), endDateTimeOfPerformance: DateHelper.createDate(day: 6, month: 9, year: 2019, hour: 17, minutes: 10)),
            Artist(name: "Uberdope", stage: .MainNorth, dayOfPerformance: .Vrijdag, startDateTimeOfPerformance: DateHelper.createDate(day: 6, month: 9, year: 2019, hour: 15, minutes: 00), endDateTimeOfPerformance: DateHelper.createDate(day: 6, month: 9, year: 2019, hour: 15, minutes: 00)),
            Artist(name: "Warhola", stage: .Club, dayOfPerformance: .Vrijdag, startDateTimeOfPerformance: DateHelper.createDate(day: 6, month: 9, year: 2019, hour: 20, minutes: 00), endDateTimeOfPerformance: DateHelper.createDate(day: 6, month: 9, year: 2019, hour: 21, minutes: 00)),
            Artist(name: "Yung Felix", stage: .Club, dayOfPerformance: .Vrijdag, startDateTimeOfPerformance: DateHelper.createDate(day: 6, month: 9, year: 2019, hour: 18, minutes: 30), endDateTimeOfPerformance: DateHelper.createDate(day: 6, month: 9, year: 2019, hour: 19, minutes: 30)),
            Artist(name: "Balthazar", stage: .MainSouth, dayOfPerformance: .Zaterdag, startDateTimeOfPerformance: DateHelper.createDate(day: 7, month: 9, year: 2019, hour: 23, minutes: 25), endDateTimeOfPerformance: DateHelper.createDate(day: 8, month: 9, year: 2019, hour: 00, minutes: 40)),
            Artist(name: "Goose", stage: .MainNorth, dayOfPerformance: .Zaterdag, startDateTimeOfPerformance: DateHelper.createDate(day: 8, month: 9, year: 2019, hour: 00, minutes: 45), endDateTimeOfPerformance: DateHelper.createDate(day: 8, month: 9, year: 2019, hour: 02, minutes: 00)),
            Artist(name: "Skunk Anansie", stage: .MainNorth, dayOfPerformance: .Zaterdag, startDateTimeOfPerformance: DateHelper.createDate(day: 7, month: 9, year: 2019, hour: 22, minutes: 05), endDateTimeOfPerformance: DateHelper.createDate(day: 7, month: 9, year: 2019, hour: 23, minutes: 20)),
            Artist(name: "Dean Lewis", stage: .MainSouth, dayOfPerformance: .Zaterdag, startDateTimeOfPerformance: DateHelper.createDate(day: 7, month: 9, year: 2019, hour: 21, minutes: 00), endDateTimeOfPerformance: DateHelper.createDate(day: 7, month: 9, year: 2019, hour: 22, minutes: 00)),
            Artist(name: "Enter Shikari", stage: .MainNorth, dayOfPerformance: .Zaterdag, startDateTimeOfPerformance: DateHelper.createDate(day: 7, month: 9, year: 2019, hour: 19, minutes: 55), endDateTimeOfPerformance: DateHelper.createDate(day: 7, month: 9, year: 2019, hour: 20, minutes: 55)),
            Artist(name: "K's Choice", stage: .MainSouth, dayOfPerformance: .Zaterdag, startDateTimeOfPerformance: DateHelper.createDate(day: 7, month: 9, year: 2019, hour: 18, minutes: 50), endDateTimeOfPerformance: DateHelper.createDate(day: 7, month: 9, year: 2019, hour: 19, minutes: 50)),
            Artist(name: "Lil Kleine", stage: .MainSouth, dayOfPerformance: .Zaterdag, startDateTimeOfPerformance: DateHelper.createDate(day: 7, month: 9, year: 2019, hour: 17, minutes: 05), endDateTimeOfPerformance: DateHelper.createDate(day: 7, month: 9, year: 2019, hour: 17, minutes: 50)),
            Artist(name: "SaSaSaS", stage: .Club, dayOfPerformance: .Zaterdag, startDateTimeOfPerformance: DateHelper.createDate(day: 8, month: 9, year: 2019, hour: 00, minutes: 00), endDateTimeOfPerformance: DateHelper.createDate(day: 8, month: 9, year: 2019, hour: 01, minutes: 00)),
            Artist(name: "Whispering Sons", stage: .MainNorth, dayOfPerformance: .Zaterdag, startDateTimeOfPerformance: DateHelper.createDate(day: 7, month: 9, year: 2019, hour: 17, minutes: 55), endDateTimeOfPerformance: DateHelper.createDate(day: 7, month: 9, year: 2019, hour: 18, minutes: 45)),
            Artist(name: "Ares", stage: .Club, dayOfPerformance: .Zaterdag, startDateTimeOfPerformance: DateHelper.createDate(day: 7, month: 9, year: 2019, hour: 16, minutes: 15), endDateTimeOfPerformance: DateHelper.createDate(day: 7, month: 9, year: 2019, hour: 17, minutes: 00)),
            Artist(name: "Black Mamba", stage: .Club, dayOfPerformance: .Zaterdag, startDateTimeOfPerformance: DateHelper.createDate(day: 7, month: 9, year: 2019, hour: 21, minutes: 15), endDateTimeOfPerformance: DateHelper.createDate(day: 7, month: 9, year: 2019, hour: 22, minutes: 45)),
            Artist(name: "DJ Yolotanker", stage: .Club, dayOfPerformance: .Zaterdag, startDateTimeOfPerformance: DateHelper.createDate(day: 8, month: 9, year: 2019, hour: 01, minutes: 00), endDateTimeOfPerformance: DateHelper.createDate(day: 8, month: 9, year: 2019, hour: 02, minutes: 00)),
            Artist(name: "Frenna", stage: .Club, dayOfPerformance: .Zaterdag, startDateTimeOfPerformance: DateHelper.createDate(day: 7, month: 9, year: 2019, hour: 15, minutes: 40), endDateTimeOfPerformance: DateHelper.createDate(day: 7, month: 9, year: 2019, hour: 16, minutes: 10)),
            Artist(name: "Gestapo Knallmuzik", stage: .MainSouth, dayOfPerformance: .Zaterdag, startDateTimeOfPerformance: DateHelper.createDate(day: 7, month: 9, year: 2019, hour: 13, minutes: 45), endDateTimeOfPerformance: DateHelper.createDate(day: 7, month: 9, year: 2019, hour: 14, minutes: 30)),
            Artist(name: "Glints", stage: .Club, dayOfPerformance: .Zaterdag, startDateTimeOfPerformance: DateHelper.createDate(day: 7, month: 9, year: 2019, hour: 19, minutes: 35), endDateTimeOfPerformance: DateHelper.createDate(day: 7, month: 9, year: 2019, hour: 20, minutes: 20)),
            Artist(name: "IBE", stage: .MainNorth, dayOfPerformance: .Zaterdag, startDateTimeOfPerformance: DateHelper.createDate(day: 7, month: 9, year: 2019, hour: 14, minutes: 35), endDateTimeOfPerformance: DateHelper.createDate(day: 7, month: 9, year: 2019, hour: 15, minutes: 20)),
            Artist(name: "K1D", stage: .Club, dayOfPerformance: .Zaterdag, startDateTimeOfPerformance: DateHelper.createDate(day: 7, month: 9, year: 2019, hour: 18, minutes: 45), endDateTimeOfPerformance: DateHelper.createDate(day: 7, month: 9, year: 2019, hour: 19, minutes: 30)),
            Artist(name: "Kanine", stage: .Club, dayOfPerformance: .Zaterdag, startDateTimeOfPerformance: DateHelper.createDate(day: 7, month: 9, year: 2019, hour: 22, minutes: 45), endDateTimeOfPerformance: DateHelper.createDate(day: 8, month: 9, year: 2019, hour: 00, minutes: 00)),
            Artist(name: "Leafs", stage: .Club, dayOfPerformance: .Zaterdag, startDateTimeOfPerformance: DateHelper.createDate(day: 7, month: 9, year: 2019, hour: 15, minutes: 05), endDateTimeOfPerformance: DateHelper.createDate(day: 7, month: 9, year: 2019, hour: 15, minutes: 35)),
            Artist(name: "Miss Angel", stage: .Club, dayOfPerformance: .Zaterdag, startDateTimeOfPerformance: DateHelper.createDate(day: 7, month: 9, year: 2019, hour: 17, minutes: 55), endDateTimeOfPerformance: DateHelper.createDate(day: 7, month: 9, year: 2019, hour: 18, minutes: 40)),
            Artist(name: "SONS", stage: .MainNorth, dayOfPerformance: .Zaterdag, startDateTimeOfPerformance: DateHelper.createDate(day: 7, month: 9, year: 2019, hour: 16, minutes: 15), endDateTimeOfPerformance: DateHelper.createDate(day: 7, month: 9, year: 2019, hour: 17, minutes: 00)),
            Artist(name: "Sports Team", stage: .MainSouth, dayOfPerformance: .Zaterdag, startDateTimeOfPerformance: DateHelper.createDate(day: 7, month: 9, year: 2019, hour: 15, minutes: 25), endDateTimeOfPerformance: DateHelper.createDate(day: 7, month: 9, year: 2019, hour: 16, minutes: 10)),
            Artist(name: "StuBru Partysquad", stage: .MainSouth, dayOfPerformance: .Zaterdag, startDateTimeOfPerformance: DateHelper.createDate(day: 8, month: 9, year: 2019, hour: 02, minutes: 05), endDateTimeOfPerformance: DateHelper.createDate(day: 8, month: 9, year: 2019, hour: 04, minutes: 00)),
            Artist(name: "The Blockparty", stage: .Club, dayOfPerformance: .Zaterdag, startDateTimeOfPerformance: DateHelper.createDate(day: 7, month: 9, year: 2019, hour: 14, minutes: 30), endDateTimeOfPerformance: DateHelper.createDate(day: 7, month: 9, year: 2019, hour: 15, minutes: 00)),
            Artist(name: "Woodie Smalls", stage: .Club, dayOfPerformance: .Zaterdag, startDateTimeOfPerformance: DateHelper.createDate(day: 7, month: 9, year: 2019, hour: 20, minutes: 25), endDateTimeOfPerformance: DateHelper.createDate(day: 7, month: 9, year: 2019, hour: 21, minutes: 10)),
            Artist(name: "Yung Mavu", stage: .Club, dayOfPerformance: .Zaterdag, startDateTimeOfPerformance: DateHelper.createDate(day: 7, month: 9, year: 2019, hour: 17, minutes: 05), endDateTimeOfPerformance: DateHelper.createDate(day: 7, month: 9, year: 2019, hour: 17, minutes: 50))
        ]
    }
}
