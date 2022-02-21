//
//  MainCoordinator.swift
//  MyMovieCollection
//
//  Created by 이건준 on 2022/02/10.
//

import UIKit
import Pure

class MainCoordinator: Coordinator, FactoryModule {
    typealias T = Model

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
            items[0].image = resizeImage(image: UIImage(named: "search.png")!, targetSize: CGSize(width: 30, height: 30))
            items[0].selectedImage = resizeImage(image: UIImage(named: "searchFill.png")!, targetSize: CGSize(width: 30, height: 30))
            items[1].title = "Popular Movie"
            items[1].image = resizeImage(image: UIImage(named: "popularity.png")!, targetSize: CGSize(width: 30, height: 30))
            items[1].selectedImage = resizeImage(image: UIImage(named: "popularityFill.png")!, targetSize: CGSize(width: 30, height: 30))
        }
    }
    
    func resizeImage(image: UIImage, targetSize: CGSize) -> UIImage {
        let size = image.size
        
        let widthRatio  = targetSize.width  / size.width
        let heightRatio = targetSize.height / size.height
        
        // Figure out what our orientation is, and use that to form the rectangle
        var newSize: CGSize
        if(widthRatio > heightRatio) {
            newSize = CGSize(width: size.width * heightRatio, height: size.height * heightRatio)
        } else {
            newSize = CGSize(width: size.width * widthRatio,  height: size.height * widthRatio)
        }
        
        // This is the rect that we've calculated out and this is what is actually used below
        let rect = CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height)
        
        // Actually do the resizing to the rect using the ImageContext stuff
        UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
        image.draw(in: rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage!
    }
    
    func cellTapped(with model: T) {
        if model is MovieListModel {
            let vc = movieDetailControllerFactory(model as! MovieListModel)
            navigationController?.pushViewController(vc, animated: true)
        }else if model is MoviePopularModel {
            let movieInforController = movieInforControllerFactory(model as! MoviePopularModel)
            navigationController?.present(movieInforController, animated: true, completion: nil)
        }
    }
    
//    func cellTapped(movieListModel: MovieListModel) {
//        print("cellTapped")
//        let vc = movieDetailControllerFactory(movieListModel)
//
////        vc.currentMovieListModel = movieListModel
//        navigationController?.pushViewController(vc, animated: true)
//    }
//
//    func cellTapped(moviePopularModel: MoviePopularModel) {
//        let movieInforController = movieInforControllerFactory(moviePopularModel)
//        navigationController?.present(movieInforController, animated: true, completion: nil)
//    }
}
