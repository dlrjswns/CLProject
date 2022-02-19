//
//  MovieInforController.swift
//  MyMovieCollection
//
//  Created by 이건준 on 2022/02/20.
//

import UIKit
import Pure

class MovieInforController: BaseViewController, FactoryModule {
    
    struct Dependency {
        let moviePopularModel: MoviePopularModel
    }
    
    required init(dependency: Dependency, payload: ()) {
        moviePopularModel = dependency.moviePopularModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let selfView = MovieInforView()
    let moviePopularModel: MoviePopularModel // VC에 뿌리기위한 Model
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func configureUI() {
        view.addSubview(selfView)
        selfView.translatesAutoresizingMaskIntoConstraints = false
        selfView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        selfView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        selfView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        selfView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        selfView.configureUI(moviePopularModel: moviePopularModel)
    }
}

