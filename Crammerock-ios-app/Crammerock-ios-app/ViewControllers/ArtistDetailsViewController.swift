//
//  ArtistViewController.swift
//  Crammerock-ios-app
//
//  Created by Jorgé Reyniers on 31/07/2019.
//  Copyright © 2019 Jorgé Reyniers. All rights reserved.
//

import UIKit

class ArtistDetailsViewController: UIViewController {
    
    var artist: Artist!

    
    @IBOutlet weak var detailLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        navigationItem.title = artist.name
        
        fetchArtistDetails(artistName: artist.name, completion: {
            (fetchedArtistDetails) in
            self.artist.artistDetails = fetchedArtistDetails
            self.updateUI()
        })
    }
    
    //View methods
    
    func updateUI() {
        print("\(artist.name) - \(artist.artistDetails?.country ?? "") - \(artist.artistDetails?.genre ?? "") - \(artist.artistDetails?.biography ?? "")")
    }
    
    //API methods
    func fetchArtistDetails(artistName: String, completion: @escaping (ArtistDetails?) -> Void) {
        let baseUrl = URL(string: "https://www.theaudiodb.com/api/v1/json/1/search.php?")!
        let query: [String: String] = [
            "s": artistName
        ]
        let url = baseUrl.withQueries(query)!
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            let jsonDecoder = JSONDecoder()
            if let data = data, let artistDetailsResults = try? jsonDecoder.decode(ArtistDetailsResults.self, from:data) {
                completion(artistDetailsResults.results.first)
            } else {
                self.sendGettingArtistDetailsFailedAlert(of: artistName)
                completion(nil)
            }
        }
        task.resume()
    }
    
    func sendGettingArtistDetailsFailedAlert(of artistName:String) {
        let alert = UIAlertController(title: "I'm sorry", message: "Couldn't get any info about \(artistName)", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }

}
