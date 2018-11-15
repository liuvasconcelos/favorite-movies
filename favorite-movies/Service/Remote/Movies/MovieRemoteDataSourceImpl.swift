//
//  FilmsRemoteDataSourceImpl.swift
//  favorite-movies
//
//  Created by Livia Vasconcelos on 15/11/18.
//  Copyright © 2018 Livia Vasconcelos. All rights reserved.
//

import Foundation

class MovieRemoteDataSourceImpl: MovieRemoteDataSource {
    
    private static var INSTANCE: MovieRemoteDataSourceImpl?
    
    private let apiDataSource: MovieApiDataSource
    
    private init(apiDataSource: MovieApiDataSource) {
        self.apiDataSource = apiDataSource
    }
    
    public static func getInstance(apiDataSource: MovieApiDataSource) -> MovieRemoteDataSourceImpl {
        if (INSTANCE == nil) {
            INSTANCE = MovieRemoteDataSourceImpl(apiDataSource: apiDataSource)
        }
        
        return INSTANCE!
    }
    
    public static func destroyInstance() {
        INSTANCE = nil
    }
    
    func searchMoviesBy(query: String, _ loadCallback: @escaping (BaseCallback<SearchMoviesResponse>) -> Void) {
        apiDataSource.searchMoviesBy(query: query, loadCallback)
    }
    
}

