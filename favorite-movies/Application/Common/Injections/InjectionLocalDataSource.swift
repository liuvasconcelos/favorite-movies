//
//  InjectionLocalDataSource.swift
//  favorite-movies
//
//  Created by Livia Vasconcelos on 17/11/18.
//  Copyright © 2018 Livia Vasconcelos. All rights reserved.
//

import RealmSwift

public class InjectionLocalDataSource {
    static let realm = try! Realm()
    
    public static func provideMovieLocalDataSource() -> MovieLocalDataSource {
        return MovieLocalDataSourceImpl.getInstance(realm: realm)
    }
    
}
