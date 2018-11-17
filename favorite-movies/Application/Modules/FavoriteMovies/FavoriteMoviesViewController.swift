//
//  FavoriteMoviesViewController.swift
//  favorite-movies
//
//  Created by Livia Vasconcelos on 17/11/18.
//  Copyright © 2018 Livia Vasconcelos. All rights reserved.
//

import UIKit

class FavoriteMoviesViewController: UIViewController, FavoriteMoviesViewContract {

    public static let NIB_NAME = "FavoriteMoviesViewController"
    
    @IBOutlet weak var favoriteMoviesTableView: FavoriteMoviesTableView!
    @IBOutlet weak var searchForMovieButton: UIButton!
    @IBOutlet weak var errorOrEmptyMessage: UILabel!

    lazy var presenter: FavoriteMoviesPresenterContract = {
        return FavoriteMoviesPresenter(view: self)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        errorOrEmptyMessage.isHidden = true
        searchForMovieButton.setTitle(AppStrings.lookForMoreFavorites, for: .normal)
        
        presenter.loadAllFavoriteMovies()
    }
    
    func show(favoriteMovies: [MovieResponse]) {
        if favoriteMovies.isEmpty {
            self.showEmptyMessage()
            return
        }
        
        favoriteMoviesTableView.isHidden = false
        errorOrEmptyMessage.isHidden     = true
        favoriteMoviesTableView.set(movies: favoriteMovies)
        favoriteMoviesTableView.reloadData()
    }
    
    @IBAction func favoriteOtherMovies(_ sender: Any) {
        print("favoritar")
    }
    
    fileprivate func showEmptyMessage() {
        setErrorOrEmpty(message: AppStrings.noFavoriteMovies)
    }
    
    func showErrorMessage() {
        setErrorOrEmpty(message: AppStrings.errorMessage)
    }
    
    fileprivate func setErrorOrEmpty(message: String) {
        favoriteMoviesTableView.isHidden = true
        errorOrEmptyMessage.isHidden     = false
        errorOrEmptyMessage.text         = message
    }
}
