//
//  InjectionRemoteDataSource.swift
//  favorite-movies
//
//  Created by Livia Vasconcelos on 15/11/18.
//  Copyright © 2018 Livia Vasconcelos. All rights reserved.
//

import Foundation

class InjectionRemoteDataSource  {
    
    static func provideMovieRemoteDataSource() -> MovieRemoteDataSource {
        let apiDataSource = InjectionApiDataSource.provideMovieApiDataSource()
        return MovieRemoteDataSourceImpl.getInstance(apiDataSource: apiDataSource)
    }
    
}
