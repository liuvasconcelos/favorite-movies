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
    
    var films = [String]()
    
    lazy var presenter: MoviesSearchPresenterContract = {
        return MoviesSearchPresenter()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        films = presenter.loadSearchedFilms(search: "")

        moviesSearchTableView.set(films: films)
    }
    
}
