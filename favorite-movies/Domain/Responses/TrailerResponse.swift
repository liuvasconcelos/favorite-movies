//
//  TrailerResponse.swift
//  favorite-movies
//
//  Created by Livia Vasconcelos on 17/11/18.
//  Copyright © 2018 Livia Vasconcelos. All rights reserved.
//

import Foundation
import ObjectMapper

public class BaseTrailer: Mappable {
    var id:      Int?
    var results: [TrailerResponse]?
    
    convenience required public init?(map: Map) {
        self.init()
    }
    
    public func mapping(map: Map) {
        id      <- map[APIFields.id]
        results <- map[APIFields.results]
    }
    
    private struct APIFields {
        static let id      = "id"
        static let results = "results"
    }
    
}

public class TrailerResponse: Mappable {
    var id:         String?
    var iso_639_1:  String?
    var iso_3166_1: String?
    var key:        String?
    var name:       String?
    var site:       String?
    var size:       Int?
    var type:       String?
    
    convenience required public init?(map: Map) {
        self.init()
    }
    
    public func mapping(map: Map) {
        id         <- map[APIFields.id]
        iso_639_1  <- map[APIFields.iso_639_1]
        iso_3166_1 <- map[APIFields.iso_3166_1]
        key        <- map[APIFields.key]
        name       <- map[APIFields.name]
        site       <- map[APIFields.site]
        size       <- map[APIFields.size]
        type       <- map[APIFields.type]
    }
    
    private struct APIFields {
        static let id         = "id"
        static let iso_639_1  = "iso_639_1"
        static let iso_3166_1 = "iso_3166_1"
        static let key        = "key"
        static let name       = "name"
        static let site       = "site"
        static let size       = "size"
        static let type       = "type"
    }
    
}
