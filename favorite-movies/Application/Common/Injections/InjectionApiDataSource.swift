//
//  InjectionApiDataSource.swift
//  favorite-movies
//
//  Created by Livia Vasconcelos on 15/11/18.
//  Copyright © 2018 Livia Vasconcelos. All rights reserved.
//

import Foundation

class InjectionApiDataSource {
    
    static func provideMovieApiDataSource() -> MovieApiDataSource {
        return MovieApiDataSourceImpl.getInstance()
    }
}
