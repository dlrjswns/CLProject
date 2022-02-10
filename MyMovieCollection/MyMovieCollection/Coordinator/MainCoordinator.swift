//
//  MainCoordinator.swift
//  MyMovieCollection
//
//  Created by 이건준 on 2022/02/10.
//

import UIKit

class MainCoordinator {
    var navigationController: UINavigationController?
    
//    let rootViewController: MovieListController
//    let movieListControllerFactory: () -> MovieListController
//
//    init(movieListControllerFactory: () -> MovieListController) {
//        self.movieListControllerFactory = movieListControllerFactory
//        self.rootViewController = movieListControllerFactory()
//    }
//
    func start(window: UIWindow, rootViewController: MovieListController) {
//        navigationController?.setViewControllers([rootViewController], animated: true)
        let rootViewController = UINavigationController(rootViewController: rootViewController)
        window.rootViewController = rootViewController
        window.makeKeyAndVisible()
    }
    
    
}
