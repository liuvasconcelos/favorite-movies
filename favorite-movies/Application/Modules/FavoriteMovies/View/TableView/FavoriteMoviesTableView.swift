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
    
    var movies = [Movie]()
    
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
        let cell = tableView.dequeueReusableCell(withIdentifier: FavoriteMoviesCell.IDENTIFIER, for: indexPath as IndexPath) as! FavoriteMoviesCell
        cell.configureView(movie: movies[indexPath.row])
        cell.contentView.isUserInteractionEnabled = true
        cell.accessibilityIdentifier = "option \(indexPath.row)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        self.goToFilmDetails(movie: movies[indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt: IndexPath) -> [UITableViewRowAction]? {
        let removeFromFavorite = UITableViewRowAction(style: .normal, title: "Remove") { action, index in
            self.remove(movie: self.movies[editActionsForRowAt.row], index: editActionsForRowAt.row)
        }
        removeFromFavorite.backgroundColor = .gray
        
        return [removeFromFavorite]
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        animateReloadData(cell: cell)
    }
    
    func set(movies: [Movie]) {
        self.movies = movies
    }
    
    func goToFilmDetails(movie: Movie) {
        self.contract?.didCellPressed(movie: movie)
    }
    
    func remove(movie: Movie, index: Int) {
        self.contract?.remove(movie: movie, index: index)
    }
    
    func animateReloadData(cell: UITableViewCell) {
        var rotation = CATransform3DMakeRotation( CGFloat((90.0 * M_PI)/180), 0.0, 0.7, 0.4);
        rotation.m34 = 1.0 / -600
        
        cell.layer.shadowOffset = CGSize(width: 10.0, height: 10.0)
        cell.alpha              = 0.0
        cell.layer.transform    = rotation
        cell.layer.anchorPoint  = CGPoint(x: 0.0, y: 0.5)
        
        cell.layer.transform = rotation
        UIView.animate(withDuration: 1.5, animations:{cell.layer.transform = CATransform3DIdentity})
        cell.alpha              = 1
        cell.layer.shadowOffset = CGSize(width: 0, height: 0)
        UIView.commitAnimations()
    }
}
