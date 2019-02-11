//
//  SearchMovies.swift
//  favorite-moviesUITests
//
//  Created by Livia Vasconcelos on 10/02/19.
//  Copyright © 2019 Livia Vasconcelos. All rights reserved.
//

import XCTest

class SearchMovies {
    let app: XCUIApplication
    var favoriteMoviesScreen: FavoriteMovies?

    
    var searchEditText: XCUIElement {
        return app.textFields["searchEditText"]
    }
    
    var searchTableView: XCUIElement {
        return app.tables["searchTableView"]
    }
    
    var errorOfEmptySearchLabel: XCUIElement {
        return app.staticTexts["errorOfEmptySearchLabel"]
    }
    
    var cancelButton: XCUIElement {
        return app.buttons["cancelButton"]
    }
    
    var firstCell: XCUIElement {
        return app.cells["cell0"]
    }
    
    var cellTitle: XCUIElement {
        return firstCell.staticTexts["cellTitle"]
    }
    
    var firstElementTitle: String?
    
    init(app: XCUIApplication) {
        self.app = app
        
        favoriteMoviesScreen = FavoriteMovies(app: app)
    }
    
    func searchMoviesBy(search: String) {
        favoriteMoviesScreen?.clickOnFavoriteFilms()

        searchEditText.tap()
        searchEditText.typeText(search)
    }
    
    func startSearchingAndThenCancelIt(search: String) {
        favoriteMoviesScreen?.clickOnFavoriteFilms()
        
        firstElementTitle = cellTitle.label
                
        searchEditText.tap()
        searchEditText.typeText(search)
        cancelButton.tap()
    }
}

