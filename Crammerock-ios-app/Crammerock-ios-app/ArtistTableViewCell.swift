//
//  ArtistTableViewCell.swift
//  Crammerock-ios-app
//
//  Created by Jorgé Reyniers on 03/08/2019.
//  Copyright © 2019 Jorgé Reyniers. All rights reserved.
//

import UIKit

class ArtistTableViewCell: UITableViewCell {

    @IBOutlet weak var artistNameLabel: UILabel!
    @IBOutlet weak var startDateTimeOfPerformanceLabel: UILabel!
    @IBOutlet weak var stageLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func update(with artist: Artist) {
        artistNameLabel.text = artist.name
        startDateTimeOfPerformanceLabel.text = DateHelper.getTimeString(date: artist.startDateTimeOfPerformance)
        stageLabel.text = artist.stage.rawValue
    }

}
