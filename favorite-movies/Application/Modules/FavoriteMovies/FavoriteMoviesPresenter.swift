//
//  FavoriteMoviesPresenter.swift
//  favorite-movies
//
//  Created by Livia Vasconcelos on 17/11/18.
//  Copyright © 2018 Livia Vasconcelos. All rights reserved.
//

public class FavoriteMoviesPresenter: FavoriteMoviesPresenterContract {

    private let view:     FavoriteMoviesViewController
    private let getMovie: GetMovie
    
    init(view: FavoriteMoviesViewController, getMovie: GetMovie) {
        self.view     = view
        self.getMovie = getMovie
    }
    
    func loadAllFavoriteMovies() {
        let movies = getMovie.loadAllFavoriteMovies()
        self.view.show(favoriteMovies: movies)
    }

}
