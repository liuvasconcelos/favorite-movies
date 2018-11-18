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
    public static let lookForMoreFavorites = localized("lookForMoreFavorites")
    public static let noFavoriteMovies     = localized("noFavoriteMovies")
    public static let noTrailerMessage     = localized("noTrailerMessage")
    public static let topRated             = localized("topRated")
    public static let noOverview           = localized("noOverview")
    
    public static func localized(_ value: String) -> String {
        return NSLocalizedString(value, tableName: nil, bundle: Bundle.main, value: "", comment: "")
    }
}

