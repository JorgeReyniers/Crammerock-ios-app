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

    
    @IBOutlet weak var bannerImageView: UIImageView!
    
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var biographyLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        navigationItem.title = artist.name
        genreLabel.text = ""
        countryLabel.text = ""
        biographyLabel.text = ""
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        fetchArtistDetails(artistName: artist.name, completion: {
            (fetchedArtistDetails) in
            if let fetchedArtistDetails = fetchedArtistDetails {
                self.artist.artistDetails = fetchedArtistDetails
                self.updateUI()
            }
        })
    }
    
    //View methods
    
    func updateUI() {
        DispatchQueue.main.async {
            self.genreLabel.text = self.artist.artistDetails?.genre
            self.countryLabel.text = self.artist.artistDetails?.country
            self.biographyLabel.text = self.artist.artistDetails?.biography
            self.fetchAndUpdateBanner()
        }
    }
    
    func fetchAndUpdateBanner() {
        if let bannerUrl = artist.artistDetails?.bannerUrl {
            let task = URLSession.shared.dataTask(with: bannerUrl, completionHandler: {(data, response, error) in
                if let data = data, let bannerImage = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self.bannerImageView.image = bannerImage
                    }
                }
            })
            task.resume()
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
        }
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
