//
//  MovieDetailView.swift
//  MyMovieCollection
//
//  Created by 이건준 on 2022/02/12.
//

import UIKit

class MovieDetailView: BaseView {
    let movieThumbnailImageView = UIImageView()
    let movieNameLabelType = NormalBoldLabel()
    let movieNameLabel = NormalBoldLabel()
    let pubDateLabelType = NormalBoldLabel()
    let pubDateLabel = NormalBoldLabel()
    let directorLabelType = NormalBoldLabel()
    let directorLabel = NormalBoldLabel()
    let userRatingLabelType = NormalBoldLabel()
    let userRatingLabel = NormalBoldLabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground
        
        addSubview(movieThumbnailImageView)
        addSubview(movieNameLabelType)
        addSubview(movieNameLabel)
        addSubview(pubDateLabelType)
        addSubview(pubDateLabel)
        addSubview(directorLabelType)
        addSubview(directorLabel)
        addSubview(userRatingLabelType)
        addSubview(userRatingLabel)
        
        movieThumbnailImageView.translatesAutoresizingMaskIntoConstraints = false
        movieThumbnailImageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        movieThumbnailImageView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        movieThumbnailImageView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        movieThumbnailImageView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height/3).isActive = true
        movieThumbnailImageView.contentMode = .scaleAspectFit
        
        movieNameLabelType.translatesAutoresizingMaskIntoConstraints = false
        movieNameLabelType.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        movieNameLabelType.topAnchor.constraint(equalTo: movieThumbnailImageView.bottomAnchor).isActive = true
        movieNameLabelType.text = "Movie name:"
        
        movieNameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        pubDateLabelType.translatesAutoresizingMaskIntoConstraints = false
        pubDateLabelType.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        pubDateLabelType.topAnchor.constraint(equalTo: movieNameLabelType.bottomAnchor, constant: 10).isActive = true
        pubDateLabelType.text = "Pubdate:"
        
        pubDateLabel.translatesAutoresizingMaskIntoConstraints = false
        
        directorLabelType.translatesAutoresizingMaskIntoConstraints = false
        directorLabelType.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        directorLabelType.topAnchor.constraint(equalTo: pubDateLabelType.bottomAnchor, constant: 10).isActive = true
        directorLabelType.text = "Director name:"
        
        directorLabel.translatesAutoresizingMaskIntoConstraints = false
        
        userRatingLabelType.translatesAutoresizingMaskIntoConstraints = false
        userRatingLabelType.translatesAutoresizingMaskIntoConstraints = false
        userRatingLabelType.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        userRatingLabelType.topAnchor.constraint(equalTo: directorLabelType.bottomAnchor, constant: 10).isActive = true
        userRatingLabelType.text = "UserRating:"
        
        userRatingLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
