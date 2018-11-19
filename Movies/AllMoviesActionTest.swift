//
//  LoadMoviesActionTest.swift
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

class AllMoviesActionTest: QuickSpec {
    
    override func spec() {
        realmDeleteIfMigrationNeeded()
        
        beforeSuite {
            realmInMemoryIdentifierConfig(name: self.name)
        }
        
        beforeEach {
            realmClean()
        }
        
        describe("#allMovies") {
            
            let realm = realmInstance()
            
            let localDataSource = MovieLocalDataSourceImpl.getInstance(realm: realm)

            var result = [Movie]()
            let movieId        = "movie-id-01"
            let movieId2       = "movie-id-02"
            let movieTitle     = "first-title"
            let movieOverview  = "movie-overview-01"
            let movieTitle2    = "second-title"
            let movieOverview2 = "movie-overview-02"
            
            let allMovies: Action = Action() {
                result = localDataSource.allMovies()
            }
            
            context("When have favorite movies saved") {
                beforeEach {
                    execute(action: allMovies) {
                        writeOnRealm() { (realm) in
                            realm.add(MovieBuilder.buildEntryWith(id: movieId, title: movieTitle, overview: movieOverview))
                            realm.add(MovieBuilder.buildEntryWith(id: movieId2, title: movieTitle2, overview: movieOverview2))
                        }
                    }
                }

                it("Should return correct number of movies") {
                    expect(result).to(haveCount(2))
                }
                
                it("Should bring it on alphabetic ordem") {
                    expect(result[0].title).to(equal(movieTitle))
                }
            }
            
            context("When do not favorite movies") {
                beforeEach {
                    execute(action: allMovies) {}
                }

                it("Should return no movies") {
                    expect(result).to(beEmpty())
                }
            }
        }
    }
}
