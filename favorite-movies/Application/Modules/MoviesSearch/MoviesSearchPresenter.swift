//
//  MoviesSearchPresenter.swift
//  favorite-movies
//
//  Created by Livia Vasconcelos on 15/11/18.
//  Copyright © 2018 Livia Vasconcelos. All rights reserved.
//

public class MoviesSearchPresenter: MoviesSearchPresenterContract {
    
    init() {
        
    }
    
    func loadSearchedFilms(search: String) -> [String] {
        let films = ["Film 01", "Film 02"]
        return films
    }
    
}
