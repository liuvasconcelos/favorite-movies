//
//  MoviesSearchTableView.swift
//  favorite-movies
//
//  Created by Livia Vasconcelos on 15/11/18.
//  Copyright © 2018 Livia Vasconcelos. All rights reserved.
//

import UIKit
import Foundation

class MoviesSearchTableView: UITableView, UITableViewDataSource, UITableViewDelegate {
    
    public static let NIB_NAME = "MoviesSearchTableView"
    public weak var contract: MoviesSearchCellContract?
    
    var movies      = [Movie]()
    var currentPage = 0
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.delegate        = self
        self.dataSource      = self
        self.separatorStyle  = .none
        
        let cell = UINib(nibName: MoviesSearchCell.NIB_NAME, bundle: nil)
        self.register(cell, forCellReuseIdentifier: MoviesSearchCell.IDENTIFIER)
        
        self.accessibilityIdentifier = "searchTableView"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MoviesSearchCell.IDENTIFIER, for: indexPath as IndexPath) as! MoviesSearchCell
        cell.configureView(movie: movies[indexPath.row])
        cell.contentView.isUserInteractionEnabled = true
        cell.accessibilityIdentifier = "cell\(indexPath.row)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt: IndexPath) -> [UITableViewRowAction]? {
        let favorite = UITableViewRowAction(style: .normal, title: "Favorite") { action, index in
            self.save(movie: self.movies[editActionsForRowAt.row])
        }
        favorite.backgroundColor = .orange
        
        return [favorite]
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == movies.count - 1 {
            self.contract?.searchForMoreMovies(currentPage: self.currentPage)
        }
        
        animateReloadData(cell: cell)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        self.goToFilmDetails(movie: movies[indexPath.row])
    }
    
    func set(movies: [Movie]) {
        self.movies = movies
    }
    
    func goToFilmDetails(movie: Movie) {
        self.contract?.didCellPressed(movie: movie)
    }
    
    func save(movie: Movie) {
        self.contract?.favorite(movie: movie)
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
