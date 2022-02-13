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
    var coordinator: MainCoordinator?
    
    var currentMovieList: [MovieListModel] = []
    
    init(viewModel: MovieListViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bind()
    }
    
    override func configureUI() {
        title = "Movie Theater"
        view.addSubview(selfView)
        selfView.translatesAutoresizingMaskIntoConstraints = false
        selfView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        selfView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        selfView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        selfView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true

        navigationItem.searchController = selfView.searchController
        selfView.searchController.searchBar.delegate = self
        
        selfView.tableView.register(MovieListCell.self, forCellReuseIdentifier: MovieListCell.identifier)
        selfView.tableView.delegate = self
        selfView.tableView.dataSource = self
    }
    
    func bind() {
        viewModel.$movieListModel.sink { [weak self] movieList in
//            print("movieList = \(movieList)")
            self?.currentMovieList = movieList
            self?.selfView.tableView.reloadData()
        }.store(in: &subscriber)
        
        viewModel.$errorMessage.sink { errorMessage in
            guard let errorMessage = errorMessage else { return }
            print("errorMessage = \(errorMessage)")
        }.store(in: &subscriber)
        
        viewModel.$isLoading.sink { [weak self] isLoading in
            self?.selfView.loadingView.isHidden = !isLoading
        }.store(in: &subscriber)
        
        viewModel.$isEmpty.sink { [weak self] isEmpty in
            self?.selfView.emptyView.isHidden = !isEmpty
        }.store(in: &subscriber)
    }
    
}

extension MovieListController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("searchText = \(searchText)")
        viewModel.searchQueryMovie(keyword: searchText)
    }
}
