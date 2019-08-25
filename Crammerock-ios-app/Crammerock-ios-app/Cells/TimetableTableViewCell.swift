//
//  TimetableTableViewCell.swift
//  Crammerock-ios-app
//
//  Created by Jorgé Reyniers on 25/08/2019.
//  Copyright © 2019 Jorgé Reyniers. All rights reserved.
//

import UIKit

class TimetableTableViewCell: UITableViewCell {

    @IBOutlet weak var startDateTimeOfPerformanceLabel: UILabel!
    @IBOutlet weak var endDateTimeOfPerformanceLabel: UILabel!
    @IBOutlet weak var artistNameLabel: UILabel!
    @IBOutlet weak var stageLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func update(with artist: Artist) {
        startDateTimeOfPerformanceLabel.text = artist.startDateTimeOfPerformance.toTimeString()
        endDateTimeOfPerformanceLabel.text = artist.endDateTimeOfPerformance.toTimeString()
        artistNameLabel.text = artist.name
        stageLabel.text = artist.stage.stringValue
    }

}
