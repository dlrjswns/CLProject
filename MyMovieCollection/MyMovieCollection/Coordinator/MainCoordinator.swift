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
    var movieListControllerFactory: () -> MovieListController
    
    required init(dependency: Dependency, payload: ()) {
        movieListControllerFactory = dependency.movieListControllerFactory
    }
    
    func cellTapped(movieListModel: MovieListModel) {
        let vc = MovieDetailController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func start() {
//        navigationController?.setViewControllers([rootViewController], animated: true)
        let movieListController = movieListControllerFactory()
        movieListController.coordinator = self
        navigationController?.setViewControllers([movieListController], animated: true)
    }
    
    
}
