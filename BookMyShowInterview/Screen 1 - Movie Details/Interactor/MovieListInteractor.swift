//
//  MovieListInteractor.swift
//  BookMyShowInterview
//
//  Created by Ashish Bahl on 22/04/21.
//

import Foundation

class MovieListInteractor: MovieListPresenterToInteractorProtocol {
    var presenter: MovieListInteractorToPresenterProtocol?
    
    func createAPIRequest() {
        
        let url = URL(string: Constants.API_URL_NOW_PLAYING)
        
        let task = URLSession.shared.dataTask(with: url!) { (data, response, err) in
            
            if (err != nil) {
                Utility.createAlert(err?.localizedDescription ?? "")
            } else{
                do {
                    if let dictValues = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? NSDictionary {
                        self.presenter?.sendDataToPresenter(dict: dictValues)
                    }
                }catch{
                    
                }
            }
        }
        task.resume()
    }
}

