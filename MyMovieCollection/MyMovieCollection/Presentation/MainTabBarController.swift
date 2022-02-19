//
//  MainTabBarController.swift
//  MyMovieCollection
//
//  Created by 이건준 on 2022/02/19.
//

import UIKit
import Pure

class MainTabBarController: UITabBarController {
    
//    struct Dependency {
//        var movieListController: MovieListController
//    }
    
//    let movieListController: MovieListController
    
//    required init(dependency: Dependency, payload: ()) {
//        movieListController = dependency.movieListController
//        super.init(nibName: nil, bundle: nil)
//    }
    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    func configureUI() {
        print("Dfsdfsfd")
        if let items = tabBarController?.tabBar.items {
            print("Dfd")
            for index in 0..<items.count {
                items[index].badgeValue = "dfd"
            }
        }
    }
}
