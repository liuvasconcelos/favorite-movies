//
//  InjectionUseCase.swift
//  favorite-movies
//
//  Created by Livia Vasconcelos on 15/11/18.
//  Copyright © 2018 Livia Vasconcelos. All rights reserved.
//

import Foundation

class InjectionUseCase {
    
    static func provideGetMovie() -> GetMovie {
        let remoteDataSource = InjectionRemoteDataSource.provideMovieRemoteDataSource()
        return GetMovie(remoteDataSource: remoteDataSource)
    }
    
}
