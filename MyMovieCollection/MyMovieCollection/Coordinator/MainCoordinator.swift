//
//  MainCoordinator.swift
//  MyMovieCollection
//
//  Created by 이건준 on 2022/02/10.
//

import UIKit
import Pure

class MainCoordinator: FactoryModule {
    
    var navigationController: UINavigationController?
    
    struct Dependency {
        let movieListControllerFactory: () -> MovieListController
        let movieDetailControllerFactory: (MovieListModel) -> MovieDetailController
    }
//    let rootViewController: MovieListController
//    let movieListControllerFactory: () -> MovieListController
//
//    init(movieListControllerFactory: () -> MovieListController) {
//        self.movieListControllerFactory = movieListControllerFactory
//        self.rootViewController = movieListControllerFactory()
//    }
//
//    let movieListController: MovieListController
    let movieListControllerFactory: () -> MovieListController
    let movieDetailControllerFactory: (MovieListModel) -> MovieDetailController
    
    required init(dependency: Dependency, payload: ()) {
        movieListControllerFactory = dependency.movieListControllerFactory
        movieDetailControllerFactory = dependency.movieDetailControllerFactory
    }
    
    func start() {
//        navigationController?.setViewControllers([rootViewController], animated: true)
        let movieListController = movieListControllerFactory()
        movieListController.coordinator = self
        navigationController?.setViewControllers([movieListController], animated: true)
    }
    
    func cellTapped(movieListModel: MovieListModel) {
        let vc = movieDetailControllerFactory(movieListModel)
//        vc.currentMovieListModel = movieListModel
        navigationController?.pushViewController(vc, animated: true)
    }
}
