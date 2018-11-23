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
    @IBOutlet weak var filmRateLabel:  UILabel!
    @IBOutlet weak var filmImage:      UIImageView!
    
    func configureView(movie: Movie) {
        filmTitleLabel.text = movie.title
        filmRateLabel.text  = AppStrings.average + String(movie.voteAverage)
        
        let imagePath = "https://image.tmdb.org/t/p/w600_and_h900_bestv2" + movie.posterPath
        if let url = NSURL(string: imagePath) {
            if let data = NSData(contentsOf: url as URL) {
                self.filmImage.image = UIImage(data: data as Data)
            }
        }
    }
    
}
