//
//  SaveGame.swift
//  favorite-movies
//
//  Created by Livia Vasconcelos on 17/11/18.
//  Copyright © 2018 Livia Vasconcelos. All rights reserved.
//

import Foundation

class SaveMovie {
    
    private let localDataSource: MovieLocalDataSource
    
    init(localDataSource: MovieLocalDataSource) {
        self.localDataSource = localDataSource
    }
    
    func saveMovieAsFavorite(movie: Movie) {
        localDataSource.save(movie: movie)
    }
    
}
