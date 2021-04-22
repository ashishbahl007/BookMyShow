//
//  MovieListRouter.swift
//  BookMyShowInterview
//
//  Created by Ashish Bahl on 22/04/21.
//

import Foundation

class MovieListRouter: MovieListPresenterToRouterProtocol {
    class func createMovieListModule(view: ViewController) {
        let presenter : MovieListViewToPresenterProtocol & MovieListInteractorToPresenterProtocol = MovieListPresenter()
        let interactor : MovieListPresenterToInteractorProtocol = MovieListInteractor()
        let router : MovieListPresenterToRouterProtocol = MovieListRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
    }
}
