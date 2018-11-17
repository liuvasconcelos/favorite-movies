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
    
    let basicUrlForSearch: String = "https://api.themoviedb.org/3/search/movie?api_key=9ce37a42a90b830bd797fce0e235ca11"
    
    public static func getInstance() -> MovieApiDataSourceImpl {
        if (INSTANCE == nil) {
            INSTANCE = MovieApiDataSourceImpl()
        }
        
        return INSTANCE!
    }
    
    public static func destroyInstance() {
        INSTANCE = nil
    }
    
    func searchMoviesBy(query: String = "", _ loadCallback: @escaping (BaseCallback<SearchMoviesResponse>) -> Void) {
        let url = buildUrlForSearch(withQuery: query)
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
    
    fileprivate func buildUrlForSearch(withQuery query: String) -> String {
        if query.isEmpty {
            return basicUrlForSearch + "&query=%20"
        } else {
            return basicUrlForSearch + "&query=" + query
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
    
}

