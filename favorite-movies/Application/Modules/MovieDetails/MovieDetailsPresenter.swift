//
//  MovieDetailsPresenter.swift
//  favorite-movies
//
//  Created by Livia Vasconcelos on 17/11/18.
//  Copyright © 2018 Livia Vasconcelos. All rights reserved.
//

public class MovieDetailsPresenter: MovieDetailsPresenterContract {

    private let view: MovieDetailsViewController
    private let getMovie: GetMovie
    
    init(view: MovieDetailsViewController, getMovie: GetMovie) {
        self.view     = view
        self.getMovie = getMovie
    }
    
    func loadTrailerFromMovieWith(id: Int) {
        view.showLoader()
        getMovie.loadTrailerFromMovieWith(id: id) { (callback) in
            callback.onSuccess({ (trailer) in
                if let results = trailer.results {
                    self.view.show(trailers: results)
                    self.view.hideLoader()
                }
            })
            
            callback.onFailed({ (error) in
                self.view.showErrorMessage()
                self.view.hideLoader()
            })
        }
    }
    
}

