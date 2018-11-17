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
    
    init(remoteDataSource: MovieRemoteDataSource) {
        self.remoteDataSource = remoteDataSource
    }
    
    func searchMoviesBy(query: String, _ loadCallback: @escaping (BaseCallback<SearchMoviesResponse>) -> Void) {
        remoteDataSource.searchMoviesBy(query: query, loadCallback)
    }
    
    func loadTrailerFromMovieWith(id : Int, _ loadCallback: @escaping (BaseCallback<BaseTrailer>) -> Void) {
        remoteDataSource.loadTrailerFromMovieWith(id: id, loadCallback)
    }
    
}
