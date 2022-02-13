//
//  MovieDetailView.swift
//  MyMovieCollection
//
//  Created by 이건준 on 2022/02/12.
//

import UIKit

class MovieDetailView: BaseView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemRed
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
