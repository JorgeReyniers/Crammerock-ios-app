//
//  NewsItemViewController.swift
//  Crammerock-ios-app
//
//  Created by Jorgé Reyniers on 10/08/2019.
//  Copyright © 2019 Jorgé Reyniers. All rights reserved.
//

import UIKit

class NewsItemViewController: UIViewController {
    
    var newsItem: NewsItem!

    @IBOutlet weak var newsItemImageView: UIImageView!
    @IBOutlet weak var publicationDateLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        // Do any additional setup after loading the view.
    }
    
    func updateUI() {
        newsItemImageView.image = UIImage(named: newsItem.imageName)
        publicationDateLabel.text = newsItem.publicationDate.toString()
        bodyLabel.text = newsItem.body
        titleLabel.text = newsItem.title
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
