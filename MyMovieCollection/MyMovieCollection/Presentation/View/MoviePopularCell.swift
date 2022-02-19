//
//  MoviePopularCell.swift
//  MyMovieCollection
//
//  Created by 이건준 on 2022/02/19.
//

import UIKit

class MoviePopularCell: UICollectionViewCell {
    
    static let identifier = "MoviePopularCell"
    
    let movieImageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureUI() {
        addSubview(movieImageView)
        movieImageView.translatesAutoresizingMaskIntoConstraints = false
        movieImageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        movieImageView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        movieImageView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        movieImageView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
    func configureUI(item: MoviePopularModel) {
        movieImageView.contentMode = .scaleAspectFill
        movieImageView.loadImage(imageUrl: item.posterPath)
    }
}
