//
//  SaveActionTest.swift
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

class SaveActionTest: QuickSpec {
    override func spec() {
        
        realmDeleteIfMigrationNeeded()
        
        beforeSuite {
            realmInMemoryIdentifierConfig(name: self.name)
        }
        
        beforeEach {
            realmClean()
        }
        
        describe("#save") {
            
            let realm = realmInstance()
            
            let localDataSource = MovieLocalDataSourceImpl.getInstance(realm: realm)
            
            var result  = [MovieEntry]()
            let movieId = "movie-id"
            
            let action: Action = Action() {
                result = Array(realm.objects(MovieEntry.self))
            }
            
            
            context("When try to save one movie") {
                
                beforeEach {
                    execute(action: action) {
                        localDataSource.save(movie: MovieBuilder.buildWith(id: movieId))
                    }
                }
                
                it("Should have one object on database") {
                    expect(result).to(haveCount(1))
                    expect(result[0].id).to(equal(movieId))
                }
            }
            
            context("When try to save two times same movie") {
                
                beforeEach {
                    execute(action: action) {
                        localDataSource.save(movie: MovieBuilder.buildWith(id: movieId))
                        localDataSource.save(movie: MovieBuilder.buildWith(id: movieId))
                    }
                }
                
                
                it("Should have only one movie") {
                    expect(result).to(haveCount(1))
                }
            }
        }
    }
}
