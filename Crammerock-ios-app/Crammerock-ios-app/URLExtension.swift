//
//  ArtistDetailsApi.swift
//  Crammerock-ios-app
//
//  Created by Jorgé Reyniers on 08/08/2019.
//  Copyright © 2019 Jorgé Reyniers. All rights reserved.
//

import Foundation

extension URL {
    func withQueries(_ queries: [String: String]) -> URL? {
        var components = URLComponents(url: self, resolvingAgainstBaseURL: true)
        components?.queryItems = queries.compactMap {
            URLQueryItem(name: $0.0, value: $0.1)
        }
        return components?.url
    }
}
