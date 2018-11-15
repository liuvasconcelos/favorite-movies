//
//  MoviesSearchViewController.swift
//  favorite-movies
//
//  Created by Livia Vasconcelos on 15/11/18.
//  Copyright © 2018 Livia Vasconcelos. All rights reserved.
//

import UIKit

class MoviesSearchViewController: UIViewController, MoviesSearchViewContract {
    public static let NIB_NAME = "MoviesSearchViewController"
    
    @IBOutlet weak var moviesSearchTableView: MoviesSearchTableView!
    
    lazy var presenter: MoviesSearchPresenterContract = {
        return MoviesSearchPresenter(view: self,
                                     getMovie: InjectionUseCase.provideGetMovie())
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        presenter.searchMoviesBy("sogra")
    }
    
    func show(movies: [MovieResponse]) {
        if movies.isEmpty {
            self.showEmptyMessage()
            return
        }
        
        moviesSearchTableView.set(movies: movies)
        moviesSearchTableView.reloadData()
    }
    
    fileprivate func showEmptyMessage() {
        print("vazio")
    }
    
    func show(error: String) {
        print("erro")
    }
}
