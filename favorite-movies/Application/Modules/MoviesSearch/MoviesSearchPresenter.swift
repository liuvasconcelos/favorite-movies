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
    
    func searchMoviesBy(_ search: String, currentPage: Int) {
        view.showLoader()
        getMovie.searchMoviesBy(query: search, page: currentPage) { (callback) in
            callback.onSuccess({ (searchMovies) in
                self.checkList(result: searchMovies, topRated: false)
            })
            
            callback.onFailed({ (error) in
                self.view.showErrorMessage()
                self.view.hideLoader()
            })
        }
    }
    
    func favorite(movie: Movie) {
        saveMovie.saveMovieAsFavorite(movie: movie)
    }
    
    func loadTopRated(page: Int) {
        self.view.showLoader()
        getMovie.loadTopRated (page: page) { (callback) in
            callback.onSuccess({ (loadTopRated) in
               self.checkList(result: loadTopRated, topRated: true)
            })
            
            callback.onFailed({ (error) in
                self.view.showErrorMessage()
                self.view.hideLoader()
            })
        }
    }
    
    fileprivate func checkList(result: SearchMoviesResponse, topRated: Bool){
        var listOfMovies: [Movie] = []
        if let movies = result.results {
            movies.forEach({ (movieResponse) in
                let movie = MovieConverter.responseToEntity(movieResponse)
                listOfMovies.append(movie)
            })
            self.view.show(movies: listOfMovies, topRated: topRated)
        } else {
            self.view.showErrorMessage()
        }
        
        self.view.hideLoader()
    }
}
