//
//  MovieListView.swift
//  MyMovieCollection
//
//  Created by 이건준 on 2022/02/10.
//

import UIKit

class MovieListView: BaseView {
    let searchController: UISearchController = {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Enter movie name"
        return searchController
    }()
    
    override func configureUI() {
        backgroundColor = .systemBackground
    }
}
