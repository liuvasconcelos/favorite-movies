//
//  FilmResponse.swift
//  favorite-movies
//
//  Created by Livia Vasconcelos on 15/11/18.
//  Copyright © 2018 Livia Vasconcelos. All rights reserved.
//

import Foundation
import ObjectMapper

public class MovieResponse: Mappable {
    var id:         Int?
    var title:      String?
    var posterPath: String?
    var overview:   String?
    
    convenience required public init?(map: Map) {
        self.init()
    }
    
    public func mapping(map: Map) {
        id         <- map[APIFields.id]
        title      <- map[APIFields.title]
        posterPath <- map[APIFields.posterPath]
        overview   <- map[APIFields.overview]
    }
    
    private struct APIFields {
        static let id         = "id"
        static let title      = "title"
        static let posterPath = "poster_path"
        static let overview   = "overview"
    }
    
}
