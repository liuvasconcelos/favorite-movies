//
//  FavoriteMoviesTableView.swift
//  favorite-movies
//
//  Created by Livia Vasconcelos on 17/11/18.
//  Copyright © 2018 Livia Vasconcelos. All rights reserved.
//

import UIKit
import Foundation

class FavoriteMoviesTableView: UITableView, UITableViewDataSource, UITableViewDelegate {
    
    public static let NIB_NAME = "FavoriteMoviesTableView"
    public weak var contract: FavoriteMoviesCellContract?
    
    var movies = [MovieResponse]()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.delegate        = self
        self.dataSource      = self
        self.separatorStyle  = .none
        
        let cell = UINib(nibName: FavoriteMoviesCell.NIB_NAME, bundle: nil)
        self.register(cell, forCellReuseIdentifier: FavoriteMoviesCell.IDENTIFIER)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FavoriteMoviesCell.IDENTIFIER, for: indexPath as IndexPath) as! MoviesSearchCell
        if let title = movies[indexPath.row].title {
            cell.configureView(film: title)
        }
        
        cell.contentView.isUserInteractionEnabled = true
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        self.goToFilmDetails(movie: movies[indexPath.row])
    }
    
    func set(movies: [MovieResponse]) {
        self.movies = movies
    }
    
    func goToFilmDetails(movie: MovieResponse) {
        self.contract?.didCellPressed(movie: movie)
    }
}
