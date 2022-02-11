//
//  MovieListView.swift
//  MyMovieCollection
//
//  Created by 이건준 on 2022/02/10.
//

import UIKit

class MovieListView: BaseView {
    
    let tableView: UITableView = .init()
    
    let searchController: UISearchController = {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Enter Movie name"
        return searchController
    }()
    
    override func configureUI() {
        backgroundColor = .systemBackground
        addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
}
