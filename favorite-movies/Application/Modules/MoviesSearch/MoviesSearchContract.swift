//
//  MoviesSearchContract.swift
//  favorite-movies
//
//  Created by Livia Vasconcelos on 15/11/18.
//  Copyright © 2018 Livia Vasconcelos. All rights reserved.
//

import Foundation

protocol MoviesSearchPresenterContract {
    func loadSearchedFilms(search: String) -> [String]
}

protocol MoviesSearchViewContract {
    
}
