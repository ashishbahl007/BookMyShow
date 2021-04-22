//
//  ViewController.swift
//  BookMyShowInterview
//
//  Created by Ashish Bahl on 22/04/21.
//

import UIKit

class ViewController: UIViewController {

    //MARK:- Outlets
    
    @IBOutlet weak var viewContent: UIView!
    @IBOutlet weak var searchBarMovies: UISearchBar!
    @IBOutlet weak var tableViewSearch: UITableView!
    @IBOutlet weak var tableViewMovieListing: UITableView!
    
    //MARK:- Var's & Let's
    
    var presenter : MovieListViewToPresenterProtocol?
    
    var moviesListModel = [MovieListEntity]()
    var filteredArray:[MovieListEntity] = [MovieListEntity]()
    
    //MARK:- View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registeringCells()
        MovieListRouter.createMovieListModule(view:self)
        presenter?.createAPIRequest()
    }

    //MARK:- Register Cells
    
    func registeringCells() {
        tableViewSearch.isHidden = true
        
        let nib = UINib(nibName: Constants.MEDIA_TABLE_VIEW_CELL, bundle: nil)
        tableViewMovieListing.register(nib, forCellReuseIdentifier: Constants.MEDIA_CELL_IDENTIFIER)
    }
}

extension ViewController : MovieListPresenterToViewProtocol {
    func sendDataToView(modelData: [MovieListEntity]) {
        moviesListModel = modelData
        DispatchQueue.main.async { [self] in
            tableViewMovieListing.reloadData()
        }
    }
}

extension ViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView.tag == 100 {
            return moviesListModel.count
        } else if tableView.tag == 101 {
            return filteredArray.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView.tag == 100 {
            if let cell = tableView.dequeueReusableCell(withIdentifier: Constants.MEDIA_CELL_IDENTIFIER, for: indexPath) as? MovieListTableViewCell {
            
                cell.labelMovieTitle.text = moviesListModel[indexPath.row].movieTitle
                cell.labelReleaseDetails.text = "Release Date : \(moviesListModel[indexPath.row].movieReleaseDate ?? "")"
                cell.labelPopularity.text = "Popularity : \(moviesListModel[indexPath.row].popularity ?? 0)"
                cell.labelOverView.text = moviesListModel[indexPath.row].movieOverview
                Utility.downloadImage(imageURL: Constants.IMAGE_BASE_URL + (moviesListModel[indexPath.row].imageURL ?? ""), imageView: cell.imageViewPoster)
                return cell
            }
        } else if tableView.tag == 101 {
            let cell = UITableViewCell.init(style: .default, reuseIdentifier: "cell")
            cell.textLabel?.text = filteredArray[indexPath.row].movieTitle
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

extension ViewController : UISearchBarDelegate {

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard !searchText.isEmpty  else {
            tableViewSearch.isHidden = true
            return
        }
        tableViewSearch.isHidden = false
        filteredArray = moviesListModel.filter({ movieTitle -> Bool in
            return (movieTitle.movieTitle?.lowercased().contains(searchText.lowercased()) ?? false)
        })
        tableViewSearch.reloadData()
    }
}

extension ViewController : UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView == tableViewMovieListing {
            searchBarMovies.text = ""
            tableViewSearch.isHidden = true
            searchBarMovies.endEditing(true)
        }
    }
}
