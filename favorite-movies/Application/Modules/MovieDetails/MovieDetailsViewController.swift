//
//  MovieDetailsViewController.swift
//  favorite-movies
//
//  Created by Livia Vasconcelos on 17/11/18.
//  Copyright © 2018 Livia Vasconcelos. All rights reserved.
//

import UIKit

class MovieDetailsViewController: UIViewController {
    public static let NIB_NAME = "MovieDetailsViewController"
    
    var movieChoosen: MovieResponse?
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var sinopseLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setNavigationBar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let movie = movieChoosen {
            titleLabel.text   = movie.title
            sinopseLabel.text = movie.overview
        } else {
            titleLabel.text   = ""
            sinopseLabel.text = ""
        }
        
    }
    
    func setNavigationBar() {
        let screenSize: CGRect = UIScreen.main.bounds
        let navBar             = UINavigationBar(frame: CGRect(x: 0, y: 0, width: screenSize.width, height: 50))
        let navItem            = UINavigationItem(title: "")
        let back               = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.cancel, target: nil, action: #selector(done))
        
        navItem.leftBarButtonItem = back
        navBar.setItems([navItem], animated: false)
        self.view.addSubview(navBar)
    }
    
    @objc func done() {
        self.dismiss(animated: true, completion: nil)
    }
    
    func set(movie: MovieResponse) {
        self.movieChoosen = movie
    }
}

