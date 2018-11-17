//
//  FavoriteMoviesPresenter.swift
//  favorite-movies
//
//  Created by Livia Vasconcelos on 17/11/18.
//  Copyright © 2018 Livia Vasconcelos. All rights reserved.
//

public class FavoriteMoviesPresenter: FavoriteMoviesPresenterContract {

    private let view: FavoriteMoviesViewController
    
    init(view: FavoriteMoviesViewController) {
        self.view = view
    }
    
    func loadAllFavoriteMovies() {
        self.view.show(favoriteMovies: [])
    }
    
//    func searchMoviesBy(_ search: String) {
//        getMovie.searchMoviesBy(query: search) { (callback) in
//            callback.onSuccess({ (searchMovies) in
//                if let movies = searchMovies.results {
//                    self.view.show(movies: movies)
//                } else {
//                    self.view.showErrorMessage()
//                }
//            })
//
//            callback.onFailed({ (error) in
//                self.view.showErrorMessage()
//            })
//        }
//    }
}
