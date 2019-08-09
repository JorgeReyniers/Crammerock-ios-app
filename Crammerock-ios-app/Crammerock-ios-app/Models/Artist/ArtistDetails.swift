//
//  ArtistDetails.swift
//  Crammerock-ios-app
//
//  Created by Jorgé Reyniers on 07/08/2019.
//  Copyright © 2019 Jorgé Reyniers. All rights reserved.
//

import Foundation

struct ArtistDetailsResults: Codable {
    var results: [ArtistDetails]
    
    init(from decoder: Decoder) throws {
        let valueContainer = try decoder.container(keyedBy: CodingKeys.self)
        self.results = try valueContainer.decode([ArtistDetails].self, forKey: CodingKeys.results)
    }
    
    enum CodingKeys: String, CodingKey {
        case results = "artists"
    }
}

struct ArtistDetails: Codable {
    var genre: String = ""
    var biography: String = ""
    var country: String = ""
    var bannerUrl: URL
    
    init(from decoder: Decoder) throws {
        let valueContainer = try decoder.container(keyedBy: CodingKeys.self)
        self.genre = try valueContainer.decode(String.self, forKey: CodingKeys.genre)
        self.biography = try valueContainer.decode(String.self, forKey: CodingKeys.biography)
        self.country = try valueContainer.decode(String.self, forKey: CodingKeys.country)
        self.bannerUrl = try valueContainer.decode(URL.self, forKey: CodingKeys.bannerUrl)
    }
    
    enum CodingKeys:  String, CodingKey {
        case genre = "strGenre"
        case biography = "strBiographyEN"
        case country = "strCountry"
        case bannerUrl = "strArtistBanner"
    }
}

