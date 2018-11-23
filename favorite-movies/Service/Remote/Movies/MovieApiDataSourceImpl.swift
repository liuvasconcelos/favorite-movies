//
//  FilmsApiDataSourceImpl.swift
//  favorite-movies
//
//  Created by Livia Vasconcelos on 15/11/18.
//  Copyright © 2018 Livia Vasconcelos. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper

class MovieApiDataSourceImpl: MovieApiDataSource {
    private static var INSTANCE: MovieApiDataSourceImpl?
    
    public static func getInstance() -> MovieApiDataSourceImpl {
        if (INSTANCE == nil) {
            INSTANCE = MovieApiDataSourceImpl()
        }
        
        return INSTANCE!
    }
    
    public static func destroyInstance() {
        INSTANCE = nil
    }
    
    func searchMoviesBy(query: String = "", page: Int = 1, _ loadCallback: @escaping (BaseCallback<SearchMoviesResponse>) -> Void) {
        let url = buildUrlForSearch(withQuery: query, page: page)
        Alamofire.request(url, method: .get).responseObject { (response: DataResponse<SearchMoviesResponse>) in
            switch(response.result) {
            case .success(let response):
                loadCallback(BaseCallback.success(response))
                break
            case .failure(let error):
                loadCallback(BaseCallback.failed(error: error))
                break
            }
        }
    }
    
    fileprivate func buildUrlForSearch(withQuery query: String, page: Int) -> String {
        let basicUrlForSearch: String = "https://api.themoviedb.org/3/search/movie?api_key=9ce37a42a90b830bd797fce0e235ca11"
        
        if query.isEmpty {
            return basicUrlForSearch + "&query=%20&page=" + String(page)
        } else {
            return basicUrlForSearch + "&query=" + query + "&page=" + String(page)
        }
    }
    
    func loadTrailerFromMovieWith(id: Int, _ loadCallback: @escaping (BaseCallback<BaseTrailer>) -> Void) {
        let url = buildUrlForSearchForTrailer(id: id)
        Alamofire.request(url, method: .get).responseObject { (response: DataResponse<BaseTrailer>) in
            switch(response.result) {
            case .success(let response):
                loadCallback(BaseCallback.success(response))
                break
            case .failure(let error):
                loadCallback(BaseCallback.failed(error: error))
                break
            }
        }
    
    }
    
    fileprivate func buildUrlForSearchForTrailer(id: Int) -> String {
        let url: String =  "https://api.themoviedb.org/3/movie/" + String(id) + "/videos?api_key=9ce37a42a90b830bd797fce0e235ca11"
        return url
    }
    
    func loadTopRated(page: Int, _ loadCallback: @escaping (BaseCallback<SearchMoviesResponse>) -> Void) {
        let url = buildUrlForLoadTopRated(page: page)
        Alamofire.request(url, method: .get).responseObject { (response: DataResponse<SearchMoviesResponse>) in
            switch(response.result) {
            case .success(let response):
                loadCallback(BaseCallback.success(response))
                break
            case .failure(let error):
                loadCallback(BaseCallback.failed(error: error))
                break
            }
        }
    }
    
    fileprivate func buildUrlForLoadTopRated(page: Int = 1) -> String {
        return "https://api.themoviedb.org/3/movie/top_rated?api_key=9ce37a42a90b830bd797fce0e235ca11&page=\(String(page))"
    }
    
}

