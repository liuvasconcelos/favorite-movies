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
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var buttonLabel: UIButton!
    @IBOutlet weak var errorOrEmptyMessage: UILabel!
    
    lazy var presenter: MoviesSearchPresenterContract = {
        return MoviesSearchPresenter(view: self,
                                     getMovie: InjectionUseCase.provideGetMovie())
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setErrorOrEmpty(message: "Por favor, realize uma busca.")
        
        buttonLabel.setTitle("Procurar", for: .normal)
    }
    
    @IBAction func searchMovies(_ sender: Any) {
        let search = searchTextField.text ?? ""
        presenter.searchMoviesBy(search)
    }
    
    func show(movies: [MovieResponse]) {
        if movies.isEmpty {
            self.showEmptyMessage()
            return
        }
        moviesSearchTableView.isHidden = false
        errorOrEmptyMessage.isHidden = true
        moviesSearchTableView.set(movies: movies)
        moviesSearchTableView.reloadData()
    }
    
    fileprivate func showEmptyMessage() {
        setErrorOrEmpty(message: "Nenhum resultado")
    }
    
    func show(error: String) {
        setErrorOrEmpty(message: "Ocorreu um erro. Tente novamente.")
    }
    
    fileprivate func setErrorOrEmpty(message: String) {
        moviesSearchTableView.isHidden = true
        errorOrEmptyMessage.isHidden   = false
        errorOrEmptyMessage.text       = message
    }
}
