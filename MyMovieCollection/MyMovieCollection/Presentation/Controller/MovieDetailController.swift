//
//  MovieDetailController.swift
//  MyMovieCollection
//
//  Created by 이건준 on 2022/02/12.
//

import Foundation
import Pure

class MovieDetailController: BaseViewController, FactoryModule {
    
    struct Dependency {
        let currentMovieListModel: MovieListModel
    }
    
    let selfView: MovieDetailView = .init()
    let currentMovieListModel: MovieListModel
    
    required init(dependency: Dependency, payload: ()) {
        currentMovieListModel = dependency.currentMovieListModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("list = \(currentMovieListModel)")
    }
    
    override func configureUI() {
        view.addSubview(selfView)
        selfView.translatesAutoresizingMaskIntoConstraints = false
        selfView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        selfView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        selfView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        selfView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        selfView.movieThumbnailImageView.loadImage(imageUrl: currentMovieListModel.image)
    }
}
