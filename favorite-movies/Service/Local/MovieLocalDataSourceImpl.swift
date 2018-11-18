//
//  MovieLocalDataSourceImpl.swift
//  favorite-movies
//
//  Created by Livia Vasconcelos on 17/11/18.
//  Copyright © 2018 Livia Vasconcelos. All rights reserved.
//

import RealmSwift

public class MovieLocalDataSourceImpl: MovieLocalDataSource {
    
    private static var INSTANCE: MovieLocalDataSourceImpl?
    private let realm: Realm
    
    private init(realm: Realm) {
        self.realm = realm
    }
    
    public static func getInstance(realm: Realm) -> MovieLocalDataSource {
        
        guard let currentInstance = INSTANCE else {
            INSTANCE = MovieLocalDataSourceImpl(realm: realm)
            return INSTANCE!
        }
        
        return currentInstance
    }
    
    public static func destroyInstance() {
        INSTANCE = nil
    }
    
    public func allMovies() -> [Movie] {
        let entries = Array(realm.objects(MovieEntry.self)
            .sorted(byKeyPath: "title",
                    ascending: false))
        
        return MovieConverter.entriesToEntites(entries)
    }

    public func save(movie: Movie) {
        let entry = MovieConverter.entityToEntry(movie)
        do {
            try realm.write {
                realm.add(entry, update: true)
                print("funcionou")
            }
        } catch {
            
        }
    }

}
