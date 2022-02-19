//
//  MoviePopularController.swift
//  MyMovieCollection
//
//  Created by 이건준 on 2022/02/19.
//

import UIKit

class MoviePopularController: BaseViewController {
    
    private let viewModel: MoviePopularViewModel
    
    let selfView: MoviePopularView = .init()
    
    init(viewModel: MoviePopularViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.moviePopularModelRelay.subscribe(onNext: { test in
            print("test = \(test)")
        }).disposed(by: disposeBag)
        
    }
    
    override func configureUI() {
        title = "Popular Movie"
        view.backgroundColor = .systemRed
        
        view.addSubview(selfView)
        selfView.translatesAutoresizingMaskIntoConstraints = false
        selfView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        selfView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        selfView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        selfView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
}
