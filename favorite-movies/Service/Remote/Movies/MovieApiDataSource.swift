//
//  FilmsApiDataSource.swift
//  favorite-movies
//
//  Created by Livia Vasconcelos on 15/11/18.
//  Copyright © 2018 Livia Vasconcelos. All rights reserved.
//

import Foundation

protocol MovieApiDataSource {
    
    func searchMoviesBy(query: String, _ loadCallback: @escaping (BaseCallback<SearchMoviesResponse>) -> Void)
    
}
