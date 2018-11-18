//
//  MoviesSearchContract.swift
//  favorite-movies
//
//  Created by Livia Vasconcelos on 15/11/18.
//  Copyright © 2018 Livia Vasconcelos. All rights reserved.
//

import Foundation

protocol MoviesSearchPresenterContract {
    func searchMoviesBy(_ search: String, currentPage: Int)
    func favorite(movie: Movie)
    func loadTopRated(page: Int)
}

protocol MoviesSearchViewContract {
    func show(movies: [Movie], topRated: Bool)
    func showErrorMessage()
}

protocol MoviesSearchCellContract: class {
    func didCellPressed(movie: Movie)
    func favorite(movie: Movie)
    func searchForMoreMovies(currentPage: Int)
}
