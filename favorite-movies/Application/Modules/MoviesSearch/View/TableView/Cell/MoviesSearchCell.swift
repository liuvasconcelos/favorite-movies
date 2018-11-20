//
//  MovieSearchCell.swift
//  favorite-movies
//
//  Created by Livia Vasconcelos on 15/11/18.
//  Copyright © 2018 Livia Vasconcelos. All rights reserved.
//

import UIKit

class MoviesSearchCell: UITableViewCell {
    
    public static let NIB_NAME   = "MoviesSearchCell"
    public static let IDENTIFIER = "MoviesSearchCellIdentifier"
    
    @IBOutlet weak var filmTitleLabel: UILabel!
    @IBOutlet weak var filmRate: UILabel!
    
    func configureView(movie: Movie) {
        filmTitleLabel.text = movie.title
        filmRate.text = AppStrings.average + String(movie.voteAverage)
    }
    
}
