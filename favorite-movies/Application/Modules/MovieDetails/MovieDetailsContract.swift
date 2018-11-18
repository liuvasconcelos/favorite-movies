//
//  MovieDetailsContract.swift
//  favorite-movies
//
//  Created by Livia Vasconcelos on 17/11/18.
//  Copyright © 2018 Livia Vasconcelos. All rights reserved.
//

import Foundation

protocol MovieDetailsPresenterContract {
    func loadTrailerFromMovieWith(id: Int)
}

protocol MovieDetailsViewContract {
    func show(trailers: [TrailerResponse])
    func showErrorMessage()
    func showLoader()
    func hideLoader()
}
