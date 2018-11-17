//
//  FavoriteMoviesContract.swift
//  favorite-movies
//
//  Created by Livia Vasconcelos on 17/11/18.
//  Copyright © 2018 Livia Vasconcelos. All rights reserved.
//

import Foundation

protocol FavoriteMoviesPresenterContract {
    func loadAllFavoriteMovies()
}

protocol FavoriteMoviesViewContract {
    func show(favoriteMovies: [MovieResponse])
    func showErrorMessage()
}

protocol FavoriteMoviesCellContract: class {
    func didCellPressed(movie: MovieResponse)
}
