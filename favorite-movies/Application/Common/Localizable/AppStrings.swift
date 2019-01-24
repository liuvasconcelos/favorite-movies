//
//  AppString.swift
//  favorite-movies
//
//  Created by Livia Vasconcelos on 15/11/18.
//  Copyright © 2018 Livia Vasconcelos. All rights reserved.
//

import Foundation

public class AppStrings {
    public static let back                 = localized("back")
    public static let searchMovieMessage   = localized("searchMovieMessage")
    public static let noResultsMessage     = localized("noResultsMessage")
    public static let errorMessage         = localized("errorMessage")
    public static let lookForMoreFavorites = localized("look.for.more.favorites")
    public static let noFavoriteMovies     = localized("noFavoriteMovies")
    public static let noTrailerMessage     = localized("noTrailerMessage")
    public static let topRated             = localized("topRated")
    public static let noOverview           = localized("noOverview")
    public static let average              = localized("average")
    public static let favorite             = localized("favorite")
    public static let cancel               = localized("cancel")
    public static let details              = localized("details")
    public static let searchForMovies      = localized("searchForMovies")
    public static let favoriteMovies       = localized("favoriteMovies")
    
    public static func localized(_ value: String) -> String {
        return NSLocalizedString(value, tableName: nil, bundle: Bundle.main, value: "", comment: "")
    }
}

enum Strings {
    static func lookForMoreFavorites(_ bundle: Bundle = Bundle.main) -> String {
        return NSLocalizedString("look.for.more.favorites", bundle:bundle, comment: "")
    }
}

