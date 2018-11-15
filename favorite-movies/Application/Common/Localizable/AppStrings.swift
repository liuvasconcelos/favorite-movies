//
//  AppString.swift
//  favorite-movies
//
//  Created by Livia Vasconcelos on 15/11/18.
//  Copyright © 2018 Livia Vasconcelos. All rights reserved.
//

import Foundation

public class AppStrings {
    public static let search             = localized("search")
    public static let searchMovieMessage = localized("searchMovieMessage")
    public static let noResultsMessage   = localized("noResultsMessage")
    public static let errorMessage       = localized("errorMessage")
    
    public static func localized(_ value: String) -> String {
        return NSLocalizedString(value, tableName: nil, bundle: Bundle.main, value: "", comment: "")
    }
}

