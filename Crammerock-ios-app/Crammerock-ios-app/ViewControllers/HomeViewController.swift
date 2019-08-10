//
//  ViewController.swift
//  Crammerock-ios-app
//
//  Created by Jorgé Reyniers on 29/07/2019.
//  Copyright © 2019 Jorgé Reyniers. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    var newsItems:[NewsItem] = []

    @IBOutlet weak var logoHeaderImage: UIImageView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var viewIsAlreadyShown: Bool = false
    
    
    struct PropertyKeys {
        static let newsItemCell = "NewsItemCell"
        static let newsItemSegue = "NewsItemSegue"
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        newsItems = NewsItem.loadNewsItems()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if !viewIsAlreadyShown {
            fadeInLogoHeaderImage()
            viewIsAlreadyShown = true
        }
    }
    
    func fadeInLogoHeaderImage() {
        logoHeaderImage.alpha = 0
        UIView.animate(withDuration: 2.0, animations: {
            self.logoHeaderImage.alpha = 1
        })
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == PropertyKeys.newsItemSegue else { return}
        if let indexPath = collectionView.indexPathsForSelectedItems?.first {
            let newsItemViewController = segue.destination as! NewsItemViewController
            newsItemViewController.newsItem = newsItems[indexPath.row]
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return newsItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PropertyKeys.newsItemCell, for: indexPath) as! NewsItemCollectionViewCell
        let newsItem = newsItems[indexPath.row]
        cell.update(with: newsItem)
        setLayoutProperties(with: cell)
        return cell
    }
    
    // SOURCE: https://github.com/rileydnorris/cardLayoutSwift
    func setLayoutProperties(with cell: UICollectionViewCell) {
        cell.contentView.layer.cornerRadius = 4.0
        cell.contentView.layer.borderWidth = 1.0
        cell.contentView.layer.borderColor = UIColor.clear.cgColor
        cell.contentView.layer.masksToBounds = false
        cell.layer.shadowColor = UIColor.gray.cgColor
        cell.layer.shadowOffset = CGSize(width: 0, height: 1.0)
        cell.layer.shadowRadius = 4.0
        cell.layer.shadowOpacity = 1.0
        cell.layer.masksToBounds = false
        cell.layer.shadowPath = UIBezierPath(roundedRect: cell.bounds, cornerRadius: cell.contentView.layer.cornerRadius).cgPath
    }
}

