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
    @IBOutlet weak var searchTextField:       UITextField!
    @IBOutlet weak var buttonLabel:           UIButton!
    @IBOutlet weak var errorOrEmptyMessage:   UILabel!
    
    lazy var presenter: MoviesSearchPresenterContract = {
        return MoviesSearchPresenter(view: self,
                                     getMovie: InjectionUseCase.provideGetMovie(),
                                     saveMovie: InjectionUseCase.provideSaveMovie())
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setNavigationBar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setErrorOrEmpty(message: AppStrings.searchMovieMessage)
        
        buttonLabel.setTitle(AppStrings.search, for: .normal)
        
        moviesSearchTableView.contract = self
    }
    
    func setNavigationBar() {
        let screenSize: CGRect = UIScreen.main.bounds
        let navBar             = UINavigationBar(frame: CGRect(x: 0, y: 0, width: screenSize.width, height: 50))
        let navItem            = UINavigationItem(title: "")
        let back               = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.cancel, target: nil, action: #selector(done))
        
        navItem.leftBarButtonItem = back
        navBar.setItems([navItem], animated: false)
        self.view.addSubview(navBar)
    }
    
    @objc func done() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func searchMovies(_ sender: Any) {
        let search = searchTextField.text ?? ""
        presenter.searchMoviesBy(search)
    }
    
    func show(movies: [Movie]) {
        if movies.isEmpty {
            self.showEmptyMessage()
            return
        }
        moviesSearchTableView.isHidden = false
        errorOrEmptyMessage.isHidden   = true
        
        moviesSearchTableView.set(movies: movies)
        moviesSearchTableView.reloadData()
    }
    
    fileprivate func showEmptyMessage() {
        setErrorOrEmpty(message: AppStrings.noResultsMessage)
    }
    
    func showErrorMessage() {
        setErrorOrEmpty(message: AppStrings.errorMessage)
    }
    
    fileprivate func setErrorOrEmpty(message: String) {
        moviesSearchTableView.isHidden = true
        errorOrEmptyMessage.isHidden   = false
        errorOrEmptyMessage.text       = message
    }
}

extension MoviesSearchViewController: MoviesSearchCellContract {

    func didCellPressed(movie: Movie) {
        let controller: MovieDetailsViewController = ViewUtils.loadNibNamed(MovieDetailsViewController.NIB_NAME, owner: self)!
        controller.set(movie: movie)
        self.present(controller, animated: true, completion: nil)
    }
    
    func favorite(movie: Movie) {
        self.presenter.favorite(movie: movie)
    }

}
