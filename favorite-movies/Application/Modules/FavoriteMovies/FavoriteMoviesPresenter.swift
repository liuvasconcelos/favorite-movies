//
//  FavoriteMoviesPresenter.swift
//  favorite-movies
//
//  Created by Livia Vasconcelos on 17/11/18.
//  Copyright © 2018 Livia Vasconcelos. All rights reserved.
//

public class FavoriteMoviesPresenter: FavoriteMoviesPresenterContract {

    private let view:        FavoriteMoviesViewController
    private let getMovie:    GetMovie
    private let deleteMovie: DeleteMovie
    
    init(view: FavoriteMoviesViewController, getMovie: GetMovie, deleteMovie: DeleteMovie) {
        self.view        = view
        self.getMovie    = getMovie
        self.deleteMovie = deleteMovie
    }
    
    func loadAllFavoriteMovies() {
        let movies = getMovie.loadAllFavoriteMovies()
        self.view.show(favoriteMovies: movies)
    }
    
    func remove(movie: Movie) -> Bool {
        return deleteMovie.removeMovieAsFavorite(movie: movie)
    }

}
