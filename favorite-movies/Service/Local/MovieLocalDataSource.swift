//
//  MovieLocalDataSource.swift
//  favorite-movies
//
//  Created by Livia Vasconcelos on 17/11/18.
//  Copyright © 2018 Livia Vasconcelos. All rights reserved.
//

import Foundation

public protocol MovieLocalDataSource: class {
    func allMovies() -> [Movie]
    func save(movie: Movie)
}
