//
//  NetworkRequest.swift
//  Crammerock-ios-app
//
//  Created by Jorgé Reyniers on 07/08/2019.
//  Copyright © 2019 Jorgé Reyniers. All rights reserved.
//

import Foundation

class NetworkRequest {
    static func doRequest() {
        let baseUrl = URL(string: "https://www.theaudiodb.com/api/v1/json/1/search.php?")!
        let query: [String: String] = [
            "s": "The Vaccines"
        ]
        let url = baseUrl.withQueries(query)!
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            let jsonDecoder = JSONDecoder()
            if let data = data, let artistDetails = try? jsonDecoder.decode(ArtistDetails.self, from:data) {
                print(artistDetails)
            }
        }
        task.resume()
    }
}

extension URL {
    func withQueries(_ queries: [String: String]) -> URL? {
        var components = URLComponents(url: self,
                                       resolvingAgainstBaseURL: true)
        components?.queryItems = queries.compactMap
            { URLQueryItem(name: $0.0, value: $0.1) }
        return components?.url
    }
}
