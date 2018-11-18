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
        return FavoriteMoviesPresenter(view: self, getMovie: InjectionUseCase.provideGetMovie())
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        errorOrEmptyMessage.isHidden   = true
        favoriteMoviesTableView.contract = self
        
        searchForMovieButton.setTitle(AppStrings.lookForMoreFavorites, for: .normal)
        
        presenter.loadAllFavoriteMovies()
    }
    
    func show(favoriteMovies: [Movie]) {
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
        let controller: MoviesSearchViewController = ViewUtils.loadNibNamed(MoviesSearchViewController.NIB_NAME, owner: self)!
        self.show(controller, sender: sender)
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

extension FavoriteMoviesViewController: FavoriteMoviesCellContract {
    
    func didCellPressed(movie: Movie) {
        let controller: MovieDetailsViewController = ViewUtils.loadNibNamed(MovieDetailsViewController.NIB_NAME, owner: self)!
        controller.set(movie: movie)
        self.present(controller, animated: true, completion: nil)
    }
    
}
