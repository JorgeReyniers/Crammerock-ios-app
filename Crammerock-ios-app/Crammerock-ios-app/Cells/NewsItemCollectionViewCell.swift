//
//  NewsItemCollectionViewCell.swift
//  Crammerock-ios-app
//
//  Created by Jorgé Reyniers on 10/08/2019.
//  Copyright © 2019 Jorgé Reyniers. All rights reserved.
//

import UIKit

class NewsItemCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var newsItemImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var publicationDateLabel: UILabel!
    
    func update(with newsItem:NewsItem) {
        newsItemImageView.image = UIImage(named: newsItem.imageName)
        titleLabel.text = newsItem.title
        publicationDateLabel.text = "Gepubliceerd op \(newsItem.publicationDate.toString())"
    }
}
