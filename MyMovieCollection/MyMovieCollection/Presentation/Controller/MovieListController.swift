//
//  MovieListController.swift
//  MyMovieCollection
//
//  Created by 이건준 on 2022/02/10.
//

import UIKit


class MovieListController: BaseViewController {
    
    let selfView: MovieListView = .init()
    private let viewModel: MovieListViewModel
    
    init(viewModel: MovieListViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.$movieListModel.sink { check in
            print("check = \(check)")
        }.store(in: &subscriber)
        
        viewModel.$errorMessage.sink { errorMessage in
            guard let errorMessage = errorMessage else { return }
            print("errorMessage = \(errorMessage)")
        }.store(in: &subscriber)
        
        viewModel.searchQueryMovie(keyword: "starwars")
    }
    
    override func configureUI() {
        view.addSubview(selfView)
        selfView.translatesAutoresizingMaskIntoConstraints = false
        selfView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        selfView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        selfView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        selfView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
//        selfView.searchController.delegate = self
//        selfView.searchController.searchResultsUpdater = self
        navigationItem.searchController = selfView.searchController
    }
}

//extension MovieListController: UISearchControllerDelegate, UISearchResultsUpdating {
//    func updateSearchResults(for searchController: UISearchController) {
//        print("ge")
//    }
//    
//    
//}
