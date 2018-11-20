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
    @IBOutlet weak var errorOrEmptyMessage:   UILabel!
    
    @IBOutlet weak var topRatedLabel: UILabel!
    @IBOutlet weak var cancelButton: UIButton!
    
    
    var loader: UIActivityIndicatorView = UIActivityIndicatorView()
    
    var movies: [Movie]       = []
    var topRated: Bool        = true
    var currentSearch: String = ""
    
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
        
        moviesSearchTableView.contract = self
        topRatedLabel.text             = AppStrings.topRated
        moviesSearchTableView.currentPage = 1
        cancelButton.setTitle(AppStrings.cancel, for: .normal)
        
        if movies.isEmpty {
            presenter.loadTopRated(page: 1)
        } else {
            topRatedLabel.isHidden         = true
            errorOrEmptyMessage.isHidden   = true
            moviesSearchTableView.isHidden = false
            moviesSearchTableView.set(movies: self.movies)
            moviesSearchTableView.reloadData()
        }
        
        searchTextField.addTarget(self, action: #selector(textFieldDidChange), for: UIControl.Event.editingChanged)
    }
    
    @objc func textFieldDidChange(textField: UITextField) {
        let search = searchTextField.text ?? ""
        self.movies                       = []
        self.topRated                     = false
        self.currentSearch                = search
        moviesSearchTableView.currentPage = 1
        
        if search.isEmpty {
            presenter.loadTopRated(page: 1)
            self.topRated = true
        }
        presenter.searchMoviesBy(search, currentPage: 1)
    }
    
    func setNavigationBar() {
        let screenSize: CGRect = UIScreen.main.bounds
        let navBar             = UINavigationBar(frame:  CGRect(x: screenSize.origin.x, y:  UIApplication.shared.statusBarFrame.height, width: screenSize.size.width, height: 44))
        let navItem            = UINavigationItem(title: "")
        let back               = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.cancel, target: nil, action: #selector(done))
        
        navItem.leftBarButtonItem = back
        navBar.setItems([navItem], animated: false)
        self.view.addSubview(navBar)
    }
    
    @objc func done() {
        self.dismiss(animated: true, completion: nil)
    }
    
    func show(movies: [Movie], topRated: Bool) {
        self.movies += movies
        if movies.isEmpty {
            self.showEmptyMessage()
            return
        }
        moviesSearchTableView.isHidden = false
        errorOrEmptyMessage.isHidden   = true
        topRatedLabel.isHidden         = !topRated

        moviesSearchTableView.set(movies: self.movies)
        if moviesSearchTableView.currentPage < 3 {
            moviesSearchTableView.setContentOffset(.zero, animated:true)
        }
        moviesSearchTableView.reloadData()
        moviesSearchTableView.currentPage += 1
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
        topRatedLabel.isHidden         = true
    }
    
    func showLoader() {
        loader.center           = self.moviesSearchTableView.center
        loader.hidesWhenStopped = true
        loader.style            = UIActivityIndicatorView.Style.gray
        
        view.addSubview(loader)
        loader.startAnimating()
    }
    
    func hideLoader() {
        loader.stopAnimating()
    }
    
    @IBAction func cancelSearch(_ sender: Any) {
        searchTextField.text = ""
        presenter.loadTopRated(page: 1)
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
    
    func searchForMoreMovies(currentPage: Int) {
        if topRated {
            self.presenter.loadTopRated(page: currentPage)
        } else {
            self.presenter.searchMoviesBy(self.currentSearch, currentPage: currentPage)
        }
    }

}
