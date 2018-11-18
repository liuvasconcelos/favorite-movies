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
    
    func configureView(film: String) {
        filmTitleLabel.text = film
        
    }
    
}
