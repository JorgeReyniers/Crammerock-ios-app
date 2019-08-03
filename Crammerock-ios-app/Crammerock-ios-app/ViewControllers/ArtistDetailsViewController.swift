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

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        updateView()
    }
    
    func updateView() {
        navigationItem.title = artist.name
    }

}
