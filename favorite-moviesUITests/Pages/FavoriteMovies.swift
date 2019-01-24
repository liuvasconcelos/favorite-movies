//
//  FavoriteMovies.swift
//  favorite-moviesUITests
//
//  Created by Livia Vasconcelos on 23/01/19.
//  Copyright © 2019 Livia Vasconcelos. All rights reserved.
//

import XCTest

class FavoriteMovies {
    let app: XCUIApplication
    
    var searchForMovieButton: XCUIElement {
        return app.buttons["searchForMovieButton"]
    }
    
    init(app: XCUIApplication) {
        self.app = app
    }
    
    func clickOnFavoriteFilms() {
        searchForMovieButton.tap()
    }
}
