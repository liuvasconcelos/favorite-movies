//
//  MovieConverter.swift
//  favorite-movies
//
//  Created by Livia Vasconcelos on 17/11/18.
//  Copyright © 2018 Livia Vasconcelos. All rights reserved.
//

import Foundation

class MovieConverter {
    
    static func entityToEntry(_ entity: Movie) -> MovieEntry {
        
        let entry = MovieEntry()
        
        entry.id         = entity.id
        entry.title      = entity.title
        entry.posterPath = entity.posterPath
        entry.overview   = entity.overview
        
        return entry
    }
    
    static func entryToEntity(_ entry: MovieEntry) -> Movie {
        
        return Movie(id:         entry.id,
                     title:      entry.title,
                     posterPath: entry.posterPath,
                     overview:   entry.overview)
    }
    
    static func responseToEntity(_ response: MovieResponse) -> Movie {
        
        return Movie(id:         String(response.id ?? 0),
                     title:      response.title ?? "",
                     posterPath: response.posterPath ?? "",
                     overview:   response.overview ?? "")
    }
    
    static func entriesToEntites(_ entries: [MovieEntry]) -> [Movie] {
        
        let entities = entries.map { movie -> Movie in
            entryToEntity(movie)
        }
        
        return entities
    }
}
