//
//  FavoriteMoviesRemoteTests.swift
//  favorite-moviesTests
//
//  Created by Livia Vasconcelos on 10/02/19.
//  Copyright © 2019 Livia Vasconcelos. All rights reserved.
//

import XCTest
@testable import favorite_movies

class FavoriteMoviesRemoteTests: XCTestCase {
    var vcFavoriteMovies: FavoriteMoviesViewController!
    var vcMoviesSearch: MoviesSearchViewController!
    
    override func setUp() {
        super.setUp()
        let favoriteViewController: FavoriteMoviesViewController = ViewUtils.loadNibNamed(FavoriteMoviesViewController.NIB_NAME, owner: self)!
        
        vcFavoriteMovies = favoriteViewController
        _ = vcFavoriteMovies.view
       
        let viewController: MoviesSearchViewController = ViewUtils.loadNibNamed(MoviesSearchViewController.NIB_NAME, owner: self)!
        
        vcMoviesSearch = viewController
        _ = vcMoviesSearch.view
        
    }

    override func tearDown() {
        super.tearDown()
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

//    func testSearchMoviesSuccess() {
//        vcFavoriteMovies.searchForMovieButton.
//        vcMoviesSearch.searchTextField.text = "Scandal"
//        vcMoviesSearch.textFieldDidChange(textField: vcMoviesSearch.searchTextField)
//        XCTAssertEqual(vcMoviesSearch.moviesSearchTableView.movies.count, 1)
//    }

}
