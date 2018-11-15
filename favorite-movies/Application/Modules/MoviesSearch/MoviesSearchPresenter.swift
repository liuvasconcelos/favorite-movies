//
//  MoviesSearchPresenter.swift
//  favorite-movies
//
//  Created by Livia Vasconcelos on 15/11/18.
//  Copyright © 2018 Livia Vasconcelos. All rights reserved.
//

public class MoviesSearchPresenter: MoviesSearchPresenterContract {
    
    private let view: MoviesSearchViewController
    private let getMovie: GetMovie
    
    init(view: MoviesSearchViewController, getMovie: GetMovie) {
        self.view     = view
        self.getMovie = getMovie
    }
    
    func searchMoviesBy(_ search: String) {
        getMovie.searchMoviesBy(query: search) { (callback) in
            callback.onSuccess({ (searchMovies) in
                if let movies = searchMovies.results {
                    self.view.show(movies: movies)
                } else {
                    self.view.show(error: "Erro")
                }
            })
            
            callback.onFailed({ (error) in
                self.view.show(error: "Erro")
            })
        }
    }
}


