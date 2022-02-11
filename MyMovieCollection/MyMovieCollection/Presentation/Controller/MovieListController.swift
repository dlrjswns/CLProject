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
    }
    
}

extension MovieListController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentMovieList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MovieListCell.identifier, for: indexPath) as? MovieListCell ?? MovieListCell()
        let currentMovie: MovieListModel  = currentMovieList[indexPath.row]
//        print("currentMovie = \(currentMovie)")
        cell.configureUI(currentMovie: currentMovie)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return selfView.screenView
    }
}

extension MovieListController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("searchText = \(searchText)")
        viewModel.searchQueryMovie(keyword: searchText)
    }
}
