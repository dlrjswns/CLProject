//
//  MoviePopularView.swift
//  MyMovieCollection
//
//  Created by 이건준 on 2022/02/19.
//

import UIKit

class MoviePopularView: BaseView {
    
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    override func configureUI() {
        backgroundColor = .systemBackground
        
        addSubview(collectionView)
        collectionView.backgroundColor = .systemBackground
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        collectionView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        collectionView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
}
