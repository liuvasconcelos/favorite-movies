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
    func remove(movie: Movie) -> Bool
}

protocol FavoriteMoviesViewContract {
    func show(favoriteMovies: [Movie])
    func showErrorMessage()
}

protocol FavoriteMoviesCellContract: class {
    func didCellPressed(movie: Movie)
    func remove(movie: Movie, index: Int)
}
