//
//  FavoriteMoviesUITests.swift
//  favorite-moviesUITests
//
//  Created by Livia Vasconcelos on 23/01/19.
//  Copyright © 2019 Livia Vasconcelos. All rights reserved.
//

import XCTest
@testable import favorite_movies

class FavoriteMoviesUITests: XCTestCase {
    let app = XCUIApplication()
    var favoriteMoviesScreen: FavoriteMovies?
    var bundle: Bundle?
    
    override func setUp() {
        super.setUp()
        bundle = Bundle(for: FavoriteMoviesUITests.self)
        favoriteMoviesScreen = FavoriteMovies(app: app)
        app.launch()
    }
    
    func testTapFavoriteMoviesButton() {
        favoriteMoviesScreen?.clickOnFavoriteFilms()
    }
    
    func testCheckButtonTitle() {
        XCTAssertEqual(favoriteMoviesScreen?.searchForMovieButton.label, AppStrings.lookForMoreFavorites)
    }
}
