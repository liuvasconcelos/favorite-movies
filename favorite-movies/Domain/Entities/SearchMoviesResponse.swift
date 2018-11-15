//
//  SearchMoviesResponse.swift
//  favorite-movies
//
//  Created by Livia Vasconcelos on 15/11/18.
//  Copyright © 2018 Livia Vasconcelos. All rights reserved.
//

import Foundation
import ObjectMapper

public class SearchMoviesResponse: Mappable {
    var page:    Int?
    var results: [MovieResponse]?
    
    convenience required public init?(map: Map) {
        self.init()
    }
    
    public func mapping(map: Map) {
        page    <- map[APIFields.page]
        results <- map[APIFields.results]

    }
    
    private struct APIFields {
        static let page    = "page"
        static let results = "results"
    }
    
}
