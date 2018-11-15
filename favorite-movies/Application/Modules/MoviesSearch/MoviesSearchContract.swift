//
//  MoviesSearchContract.swift
//  favorite-movies
//
//  Created by Livia Vasconcelos on 15/11/18.
//  Copyright © 2018 Livia Vasconcelos. All rights reserved.
//

import Foundation

protocol MoviesSearchPresenterContract {
    func searchMoviesBy(_ search: String) 
}

protocol MoviesSearchViewContract {
    func show(movies: [MovieResponse])
    func show(error: String)
}
