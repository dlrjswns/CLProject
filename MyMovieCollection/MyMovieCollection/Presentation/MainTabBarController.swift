//
//  MainTabBarController.swift
//  MyMovieCollection
//
//  Created by 이건준 on 2022/02/19.
//

import UIKit
import Pure

class MainTabBarController: UITabBarController, FactoryModule {
    
    struct Dependency {
        var movieListController: MovieListController
    }
    
    let movieListController: MovieListController
    
    required init(dependency: Dependency, payload: ()) {
        movieListController = dependency.movieListController
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    func configureUI() {
        
    }
}
