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
    var tabBarController: UITabBarController?
    
    struct Dependency {
//        let mainTabBarControllerFactory: MainTabBarController
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
//    let mainTabBarControllerFactory: MainTabBarController
    let movieListControllerFactory: () -> MovieListController
    let movieDetailControllerFactory: (MovieListModel) -> MovieDetailController
    let rootViewController: MovieListController
    
    required init(dependency: Dependency, payload: ()) {
//        mainTabBarControllerFactory = dependency.mainTabBarControllerFactory
        movieListControllerFactory = dependency.movieListControllerFactory
        movieDetailControllerFactory = dependency.movieDetailControllerFactory
        rootViewController = movieListControllerFactory()
    }
    
    func start() {
//        navigationController?.setViewControllers([rootViewController], animated: true)
//        let movieListController = movieListControllerFactory()
        rootViewController.coordinator = self
        navigationController?.setViewControllers([rootViewController], animated: true)
        tabBarController?.setViewControllers([navigationController!], animated: true)
    }
    
    func cellTapped(movieListModel: MovieListModel) {
        print("cellTapped")
        let vc = movieDetailControllerFactory(movieListModel)
        
//        vc.currentMovieListModel = movieListModel
        navigationController?.pushViewController(vc, animated: true)
    }
}
