//
//  ViewController.swift
//  Crammerock-ios-app
//
//  Created by Jorgé Reyniers on 29/07/2019.
//  Copyright © 2019 Jorgé Reyniers. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var logoHeaderImage: UIImageView!
    var viewIsAlreadyShown: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
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
}

