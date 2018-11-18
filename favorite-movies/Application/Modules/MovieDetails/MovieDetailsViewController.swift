//
//  MovieDetailsViewController.swift
//  favorite-movies
//
//  Created by Livia Vasconcelos on 17/11/18.
//  Copyright © 2018 Livia Vasconcelos. All rights reserved.
//

import UIKit

class MovieDetailsViewController: UIViewController, MovieDetailsViewContract {
  
    public static let NIB_NAME = "MovieDetailsViewController"
    
    var movieChoosen: Movie?
    
    @IBOutlet weak var titleLabel:          UILabel!
    @IBOutlet weak var sinopseLabel:        UILabel!
    @IBOutlet weak var emptyOrErrorMessage: UILabel!
    @IBOutlet weak var trailerContent:      UIWebView!
    
    lazy var presenter: MovieDetailsPresenterContract = {
        return MovieDetailsPresenter(view: self,
                                     getMovie: InjectionUseCase.provideGetMovie())
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setNavigationBar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter.loadTrailerFromMovieWith(id: Int(movieChoosen?.id ?? "0") ?? 0)
        emptyOrErrorMessage.isHidden = true
        
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
    
    func set(movie: Movie) {
        self.movieChoosen = movie
    }
    
    func show(trailers: [TrailerResponse]) {
        if trailers.isEmpty {
            emptyOrErrorMessage.isHidden = false
            emptyOrErrorMessage.text     = AppStrings.noTrailerMessage
            return
        }
        
        trailers.forEach { (trailer) in
            if trailer.site == "YouTube" {
                let url = URL(string: "https://www.youtube.com/embed/" + trailer.key!)
                trailerContent.loadRequest(URLRequest(url: url!))
                return
            }
        }
    }
    
    func showErrorMessage() {
        emptyOrErrorMessage.isHidden = false
        emptyOrErrorMessage.text     = AppStrings.errorMessage
    }
    
}

