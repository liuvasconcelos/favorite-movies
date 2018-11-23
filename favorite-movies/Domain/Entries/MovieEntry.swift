//
//  MovieEntry.swift
//  favorite-movies
//
//  Created by Livia Vasconcelos on 17/11/18.
//  Copyright © 2018 Livia Vasconcelos. All rights reserved.
//

import RealmSwift

class MovieEntry: Object {
    
    @objc dynamic var id          = String()
    @objc dynamic var title       = String()
    @objc dynamic var posterPath  = String()
    @objc dynamic var overview    = String()
    @objc dynamic var voteAverage = Float()
    
    override static func primaryKey() -> String? {
        return "id"
    }
}
