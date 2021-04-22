//
//  MovieListPresenter.swift
//  BookMyShowInterview
//
//  Created by Ashish Bahl on 22/04/21.
//

import Foundation

class MovieListPresenter : MovieListViewToPresenterProtocol {
    
    var view: MovieListPresenterToViewProtocol?
    var interactor: MovieListPresenterToInteractorProtocol?
    var router: MovieListPresenterToRouterProtocol?
    
    func createAPIRequest() {
        interactor?.createAPIRequest()
    }
}

extension MovieListPresenter : MovieListInteractorToPresenterProtocol {
    func sendDataToPresenter(dict: NSDictionary) {
        var arrMovieMovieListModel = [MovieListEntity]()
        if let array = dict["results"] as? NSArray {
            for i in 0..<array.count {
                let movieListModel = MovieListEntity()
                
                let moviePoster = array.value(forKey: "poster_path") as? NSArray
                let movieTitle = array.value(forKey: "title") as? NSArray
                movieListModel.movieTitlesArr = movieTitle
                
                let movieOverview = array.value(forKey: "overview") as? NSArray
                let moviePopularity = array.value(forKey: "popularity") as? NSArray
                let movieReleaseDate = array.value(forKey: "release_date") as? NSArray
                
                if let unwrappedMoviePoster = moviePoster {
                    movieListModel.imageURL = unwrappedMoviePoster[i] as? String
                }
            
                if let unwrappedMovieTitle = movieTitle {
                    movieListModel.movieTitle = unwrappedMovieTitle[i] as? String
                }
            
                if let unwrappedMovieOverview = movieOverview {
                    movieListModel.movieOverview = unwrappedMovieOverview[i] as? String
                }
          
                if let unwrappedMoviePopularity = moviePopularity {
                    movieListModel.popularity = unwrappedMoviePopularity[i] as? Double
                }
                
                if let unwrappedMovieReleaseDate = movieReleaseDate {
                    movieListModel.movieReleaseDate = unwrappedMovieReleaseDate[i] as? String
                }
                
                arrMovieMovieListModel.append(movieListModel)
            }
        }
        view?.sendDataToView(modelData: arrMovieMovieListModel)
    }
}
