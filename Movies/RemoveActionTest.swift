//
//  RemoveActionTest.swift
//  favorite-moviesTests
//
//  Created by Stant 02 on 19/11/18.
//  Copyright © 2018 Livia Vasconcelos. All rights reserved.
//

@testable import favorite_movies
import Foundation
import RealmSwift
import Quick
import Nimble

class RemoveActionTest: QuickSpec {
    override func spec() {
        
        realmDeleteIfMigrationNeeded()
        
        beforeSuite {
            realmInMemoryIdentifierConfig(name: self.name)
        }
        
        beforeEach {
            realmClean()
        }
        
        describe("#remove") {
            
            let realm = realmInstance()
            
            let localDataSource = MovieLocalDataSourceImpl.getInstance(realm: realm)
            
            var removed: Bool = false
            
            var result   = [MovieEntry]()
            let movieId  = "movie-id"
            let movieId2 = "movie-id-2"
            
            let movie    = MovieBuilder.buildWith(id: movieId)
            let movie2   = MovieBuilder.buildWith(id: movieId2)
            
            let action: Action = Action() {
                result = Array(realm.objects(MovieEntry.self))
            }
            
            context("When have favorite movies") {
    
                beforeEach {
                    execute(action: action) {
                        
                        writeOnRealm() { (realm) in
                            realm.add(MovieConverter.entityToEntry(movie))
                            realm.add(MovieConverter.entityToEntry(movie2))
                        }
                        
                        removed = localDataSource.remove(movie: movie)
                    }
                }
                
                it("Should have only one movie") {
                    expect(result).to(haveCount(1))
                    expect(result[0].id).to(equal(movieId2))
                    expect(removed).to(equal(true))
                }
            }
            
            context("When do not have saved objects") {
                
                beforeEach {
                    execute(action: action) {
                        removed = localDataSource.remove(movie: movie)
                    }
                }
                
                it("Should have none objects") {
                    expect(result).to(beEmpty())
                    expect(removed).to(equal(true))
                }
            }
        }
    }
}
