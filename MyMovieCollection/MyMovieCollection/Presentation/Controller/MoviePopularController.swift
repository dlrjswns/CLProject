//
//  MoviePopularController.swift
//  MyMovieCollection
//
//  Created by 이건준 on 2022/02/19.
//

import UIKit
import RxCocoa

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
        bindUI()
    }
    
    override func configureUI() {
        title = "Popular Movie"
        
        view.addSubview(selfView)
        selfView.translatesAutoresizingMaskIntoConstraints = false
        selfView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        selfView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        selfView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        selfView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        selfView.collectionView.register(MoviePopularCell.self, forCellWithReuseIdentifier: MoviePopularCell.identifier)
        selfView.collectionView.delegate = self
    }
    
    func bindUI() {
        viewModel.moviePopularModelRelay.bind(to: selfView.collectionView.rx.items(cellIdentifier: MoviePopularCell.identifier, cellType: MoviePopularCell.self)) { index, item, cell in
            cell.configureUI(item: item)
        }.disposed(by: disposeBag)
        
        viewModel.errorMessage.subscribe(onNext: { error in
            guard let error = error else { return }
            print("error = \(error.errorMessage ?? "No defined error")")
        }).disposed(by: disposeBag)
    }
}
