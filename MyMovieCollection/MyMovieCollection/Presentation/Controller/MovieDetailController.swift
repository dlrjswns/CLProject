//
//  MovieDetailController.swift
//  MyMovieCollection
//
//  Created by 이건준 on 2022/02/12.
//

import Foundation

class MovieDetailController: BaseViewController {
    
    let selfView: MovieDetailView = .init()
    
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
    }
}
