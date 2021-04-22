//
//  MovieListProtocols.swift
//  BookMyShowInterview
//
//  Created by Ashish Bahl on 22/04/21.
//

import Foundation

protocol MovieListViewToPresenterProtocol : class {
    var view : MovieListPresenterToViewProtocol? {get set}
    var interactor : MovieListPresenterToInteractorProtocol? {get set}
    var router : MovieListPresenterToRouterProtocol? {get set}
    
    func createAPIRequest()
}

protocol MovieListPresenterToViewProtocol : class {
    func sendDataToView(modelData: [MovieListEntity])
}

protocol MovieListPresenterToRouterProtocol : class {
    
}

protocol MovieListPresenterToInteractorProtocol : class {
    var presenter : MovieListInteractorToPresenterProtocol? {get set}
    
    func createAPIRequest()
}

protocol MovieListInteractorToPresenterProtocol : class {
    func sendDataToPresenter(dict: NSDictionary)
}
