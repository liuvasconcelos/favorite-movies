//
//  GetFilm.swift
//  favorite-movies
//
//  Created by Livia Vasconcelos on 15/11/18.
//  Copyright © 2018 Livia Vasconcelos. All rights reserved.
//

import Foundation

class GetMovie {
    
    private let remoteDataSource: MovieRemoteDataSource
    private let localDataSource:  MovieLocalDataSource
    
    init(remoteDataSource: MovieRemoteDataSource, localDataSource: MovieLocalDataSource) {
        self.remoteDataSource = remoteDataSource
        self.localDataSource  = localDataSource
    }
    
    func searchMoviesBy(query: String, _ loadCallback: @escaping (BaseCallback<SearchMoviesResponse>) -> Void) {
        remoteDataSource.searchMoviesBy(query: query, loadCallback)
    }
    
    func loadTrailerFromMovieWith(id : Int, _ loadCallback: @escaping (BaseCallback<BaseTrailer>) -> Void) {
        remoteDataSource.loadTrailerFromMovieWith(id: id, loadCallback)
    }
    
    func loadAllFavoriteMovies() -> [Movie]{
        return localDataSource.allMovies()
    }
    
    func loadTopRated(page: Int, _ loadCallback: @escaping (BaseCallback<SearchMoviesResponse>) -> Void) {
        remoteDataSource.loadTopRated(page: page, loadCallback)
    }

}
