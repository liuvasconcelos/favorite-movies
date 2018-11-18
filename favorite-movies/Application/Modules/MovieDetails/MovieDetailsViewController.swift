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
    
    var loader: UIActivityIndicatorView = UIActivityIndicatorView()
    
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
        
        showMovieDetails()
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
    
    fileprivate func showMovieDetails() {
        self.titleLabel.alpha   = 0.0
        self.sinopseLabel.alpha = 0.0
        
        UIView.animate(withDuration: 3.0) {
            if let movie = self.movieChoosen {
                self.titleLabel.text = movie.title
                if movie.overview.isEmpty {
                    self.sinopseLabel.text = AppStrings.noOverview
                    return
                }
                self.sinopseLabel.text = movie.overview
            } else {
                self.titleLabel.text   = ""
                self.sinopseLabel.text = ""
            }
            
            self.titleLabel.alpha   = 1.0
            self.sinopseLabel.alpha = 1.0
        }
    }
    @objc func done() {
        self.dismiss(animated: true, completion: nil)
    }
    
    func set(movie: Movie) {
        self.movieChoosen = movie
    }
    
    func show(trailers: [TrailerResponse]) {
        if trailers.isEmpty {
            emptyOrErrorMessage.alpha = 0.0
            UIView.animate(withDuration: 3.0) {
                self.emptyOrErrorMessage.isHidden = false
                self.emptyOrErrorMessage.text     = AppStrings.noTrailerMessage
                self.emptyOrErrorMessage.alpha    = 1.0
            }
            return
        }
        
        trailers.forEach { (trailer) in
            self.trailerContent.alpha = 0.0
            if trailer.site == "YouTube" {
                UIView.animate(withDuration: 3.0, animations: {
                    let url = URL(string: "https://www.youtube.com/embed/" + trailer.key!)
                    self.trailerContent.loadRequest(URLRequest(url: url!))
                    self.trailerContent.alpha = 1.0
                    return
                })
                
                let url = URL(string: "https://www.youtube.com/embed/" + trailer.key!)
                self.trailerContent.loadRequest(URLRequest(url: url!))
                return
                
            }
        }
    }
    
    func showErrorMessage() {
        emptyOrErrorMessage.isHidden = false
        emptyOrErrorMessage.text     = AppStrings.errorMessage
    }
    
    func showLoader() {
        loader.center           = self.trailerContent.center
        loader.hidesWhenStopped = true
        loader.style            = UIActivityIndicatorView.Style.gray
        
        view.addSubview(loader)
        loader.startAnimating()
    }
    
    func hideLoader() {
        loader.stopAnimating()
    }
}

