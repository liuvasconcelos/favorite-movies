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
        let localDataSource  = InjectionLocalDataSource.provideMovieLocalDataSource()
        return GetMovie(remoteDataSource: remoteDataSource, localDataSource: localDataSource)
    }
    
    static func provideSaveMovie() -> SaveMovie {
        let localDataSource = InjectionLocalDataSource.provideMovieLocalDataSource()
        return SaveMovie(localDataSource: localDataSource)
    }
    
    static func provideDeleteMovie() -> DeleteMovie {
        let localDataSource = InjectionLocalDataSource.provideMovieLocalDataSource()
        return DeleteMovie(localDataSource: localDataSource)
    }
}
