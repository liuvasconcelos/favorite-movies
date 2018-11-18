//
//  MoviesSearchPresenter.swift
//  favorite-movies
//
//  Created by Livia Vasconcelos on 15/11/18.
//  Copyright © 2018 Livia Vasconcelos. All rights reserved.
//

public class MoviesSearchPresenter: MoviesSearchPresenterContract {
    
    private let view:      MoviesSearchViewController
    private let getMovie:  GetMovie
    private let saveMovie: SaveMovie
    
    init(view: MoviesSearchViewController, getMovie: GetMovie, saveMovie: SaveMovie) {
        self.view      = view
        self.getMovie  = getMovie
        self.saveMovie = saveMovie
    }
    
    func searchMoviesBy(_ search: String) {
        getMovie.searchMoviesBy(query: search) { (callback) in
            callback.onSuccess({ (searchMovies) in
                var listOfMovies: [Movie] = []
                if let movies = searchMovies.results {
                    movies.forEach({ (movieResponse) in
                        let movie = MovieConverter.responseToEntity(movieResponse)
                        listOfMovies.append(movie)
                    })
                    self.view.show(movies: listOfMovies)
                } else {
                    self.view.showErrorMessage()
                }
            })
            
            callback.onFailed({ (error) in
                self.view.showErrorMessage()
            })
        }
    }
    
    func favorite(movie: Movie) {
        saveMovie.saveMovieAsFavorite(movie: movie)
    }
}
