//
//  MovieBuilder.swift
//  favorite-moviesTests
//
//  Created by Stant 02 on 19/11/18.
//  Copyright © 2018 Livia Vasconcelos. All rights reserved.
//

import Foundation
@testable import favorite_movies

public class MovieBuilder {
    
    public static func buildWith(id: String         = "movie-id",
                                 title: String      = "movie-title",
                                 posterPath: String = "movie-poster-path",
                                 overview: String   = "movie-overview") -> Movie {
        return Movie(id: id,
                     title: title,
                     posterPath: posterPath,
                     overview: overview, voteAverage: 1.0)
    }
    
    public static func buildEntryWith(id: String         = "movie-id",
                                      title: String      = "movie-title",
                                      posterPath: String = "movie-poster-path",
                                      overview: String   = "movie-overview") -> MovieEntry{
        return MovieConverter.entityToEntry(buildWith(id: id,
                                                      title: title,
                                                      posterPath: posterPath,
                                                      overview: overview))
    }
    
}
