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
    
    override func configureUI() {
        backgroundColor = .systemBackground
        
        //dummy
//        movieNameLabel.text = "dfdf"
//        pubDateLabel.text = "dfsadf"
//        directorLabel.text = "afaff"
//        userRatingLabel.text = "fdfdff"
        
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
        movieNameLabelType.leftAnchor.constraint(equalTo: leftAnchor, constant: 10).isActive = true
        movieNameLabelType.topAnchor.constraint(equalTo: movieThumbnailImageView.bottomAnchor).isActive = true
        movieNameLabelType.text = "Movie name:"
        
        movieNameLabel.translatesAutoresizingMaskIntoConstraints = false
        movieNameLabel.centerYAnchor.constraint(equalTo: movieNameLabelType.centerYAnchor).isActive = true
        movieNameLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -10).isActive = true
        
        pubDateLabelType.translatesAutoresizingMaskIntoConstraints = false
        pubDateLabelType.leftAnchor.constraint(equalTo: leftAnchor, constant: 10).isActive = true
        pubDateLabelType.topAnchor.constraint(equalTo: movieNameLabelType.bottomAnchor, constant: 10).isActive = true
        pubDateLabelType.text = "Pubdate:"
        
        pubDateLabel.translatesAutoresizingMaskIntoConstraints = false
        pubDateLabel.centerYAnchor.constraint(equalTo: pubDateLabelType.centerYAnchor).isActive = true
        pubDateLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -10).isActive = true
        
        directorLabelType.translatesAutoresizingMaskIntoConstraints = false
        directorLabelType.leftAnchor.constraint(equalTo: leftAnchor, constant: 10).isActive = true
        directorLabelType.topAnchor.constraint(equalTo: pubDateLabelType.bottomAnchor, constant: 10).isActive = true
        directorLabelType.text = "Director name:"
        
        directorLabel.translatesAutoresizingMaskIntoConstraints = false
        directorLabel.centerYAnchor.constraint(equalTo: directorLabelType.centerYAnchor).isActive = true
        directorLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -10).isActive = true
        
        userRatingLabelType.translatesAutoresizingMaskIntoConstraints = false
        userRatingLabelType.translatesAutoresizingMaskIntoConstraints = false
        userRatingLabelType.leftAnchor.constraint(equalTo: leftAnchor, constant: 10).isActive = true
        userRatingLabelType.topAnchor.constraint(equalTo: directorLabelType.bottomAnchor, constant: 10).isActive = true
        userRatingLabelType.text = "UserRating:"
        
        userRatingLabel.translatesAutoresizingMaskIntoConstraints = false
        userRatingLabel.centerYAnchor.constraint(equalTo: userRatingLabelType.centerYAnchor).isActive = true
        userRatingLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -10).isActive = true
    }
    
    func configureUI(currentMovieListModel: MovieListModel) {
        movieThumbnailImageView.loadImage(imageUrl: currentMovieListModel.image)
        movieNameLabel.text = currentMovieListModel.title.removeBandSlashB()
        pubDateLabel.text = currentMovieListModel.pubDate
        directorLabel.text = currentMovieListModel.director.removeVerticalLetter()
        userRatingLabel.text = "⭐️" + currentMovieListModel.userRating
    }
}
