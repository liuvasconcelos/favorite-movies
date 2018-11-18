//
//  FavoriteMoviesCell.swift
//  favorite-movies
//
//  Created by Livia Vasconcelos on 17/11/18.
//  Copyright © 2018 Livia Vasconcelos. All rights reserved.
//

import UIKit

class FavoriteMoviesCell: UITableViewCell {
    
    public static let NIB_NAME   = "FavoriteMoviesCell"
    public static let IDENTIFIER = "FavoriteMoviesCellIdentifier"
    
    @IBOutlet weak var filmTitleLabel: UILabel!
    
    func configureView(film: String) {
        filmTitleLabel.text = film
    }
    
}
