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
    var tabBarController: MainTabBarController?
    
    struct Dependency {
//        let mainTabBarControllerFactory: MainTabBarController
        let movieListControllerFactory: () -> MovieListController
        let movieDetailControllerFactory: (MovieListModel) -> MovieDetailController
        let moviePopularControllerFactory: () -> MoviePopularController
        let movieInforControllerFactory: (MoviePopularModel) -> MovieInforController
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
    let moviePopularControllerFactory: () -> MoviePopularController
    let movieInforControllerFactory: (MoviePopularModel) -> MovieInforController
    let rootViewController: MovieListController
    
    
    required init(dependency: Dependency, payload: ()) {
//        mainTabBarControllerFactory = dependency.mainTabBarControllerFactory
        movieListControllerFactory = dependency.movieListControllerFactory
        movieDetailControllerFactory = dependency.movieDetailControllerFactory
        moviePopularControllerFactory = dependency.moviePopularControllerFactory
        movieInforControllerFactory = dependency.movieInforControllerFactory
        rootViewController = movieListControllerFactory()
    }
    
    func start() {
        let moviePopularController = moviePopularControllerFactory()
        rootViewController.coordinator = self
        moviePopularController.coordinator = self
        navigationController?.setViewControllers([rootViewController], animated: true)
        tabBarController?.setViewControllers([navigationController!, moviePopularController], animated: true)
        if let items = tabBarController?.tabBar.items {
            items[0].title = "Movie Theater"
            items[1].title = "Popular Movie"
        }
    }
    
    func cellTapped(movieListModel: MovieListModel) {
        print("cellTapped")
        let vc = movieDetailControllerFactory(movieListModel)
        
//        vc.currentMovieListModel = movieListModel
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func cellTapped(moviePopularModel: MoviePopularModel) {
        let movieInforController = movieInforControllerFactory(moviePopularModel)
        navigationController?.present(movieInforController, animated: true, completion: nil)
    }
}
