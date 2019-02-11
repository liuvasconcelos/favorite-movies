//
//  SearchMovisUITests.swift
//  favorite-moviesUITests
//
//  Created by Livia Vasconcelos on 10/02/19.
//  Copyright © 2019 Livia Vasconcelos. All rights reserved.
//

import XCTest
@testable import favorite_movies

class SearchMoviesUITests: XCTestCase {
    let app = XCUIApplication()
    var searchMoviesScreen: SearchMovies?
    var bundle: Bundle?
    
    override func setUp() {
        super.setUp()
        bundle = Bundle(for: SearchMoviesUITests.self)
        searchMoviesScreen   = SearchMovies(app: app)
        app.launch()
    }
    
    func testSearchMoviesWithValidSearch() {
        searchMoviesScreen?.searchMoviesBy(search: "Scandal")
        XCTAssertNotNil(searchMoviesScreen?.searchTableView)
        XCTAssertGreaterThan(searchMoviesScreen!.searchTableView.cells.count, 0)
    }
    
    func testSearchMoviesWithInvalidSearch() {
        searchMoviesScreen?.searchMoviesBy(search: "Livia")
        XCTAssertEqual(searchMoviesScreen!.searchTableView.cells.count, 0)
        XCTAssertTrue(searchMoviesScreen!.errorOfEmptySearchLabel.exists)
        XCTAssertEqual(searchMoviesScreen!.errorOfEmptySearchLabel.label, "Your search brought no results.")
    }
    
    func testCancelSearching() {
        searchMoviesScreen?.startSearchingAndThenCancelIt(search: "some text")
        XCTAssertEqual(searchMoviesScreen?.firstElementTitle!, searchMoviesScreen!.cellTitle.label)
        
        
    }
    
    

}

