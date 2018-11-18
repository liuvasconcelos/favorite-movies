//
//  RemoveMovie.swift
//  favorite-movies
//
//  Created by Livia Vasconcelos on 17/11/18.
//  Copyright © 2018 Livia Vasconcelos. All rights reserved.
//

import Foundation

class DeleteMovie {
    
    private let localDataSource: MovieLocalDataSource
    
    init(localDataSource: MovieLocalDataSource) {
        self.localDataSource = localDataSource
    }
    
    func removeMovieAsFavorite(movie: Movie) -> Bool{
        return localDataSource.remove(movie: movie)
    }
    
}
