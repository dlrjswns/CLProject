//
//  MoviePopularView.swift
//  MyMovieCollection
//
//  Created by 이건준 on 2022/02/19.
//

import UIKit

class MoviePopularView: BaseView {
    
    let collectionView: UICollectionView = .init(frame: .zero, collectionViewLayout: UICollectionViewLayout())
    
    override func configureUI() {
        backgroundColor = .systemRed
    }
}
