//
//  MovieListCell.swift
//  MyMovieCollection
//
//  Created by 이건준 on 2022/02/11.
//

import UIKit

class MovieListCell: UITableViewCell {
    static let identifier = "MovieListCell"
    
    let movieTitleLabel = NormalBoldLabel()
    let moviePubDateLabel = NormalBoldLabel()
    let movieUserRatingLabel = NormalBoldLabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureUI() {
        addSubview(movieTitleLabel)
        movieTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        movieTitleLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
        movieTitleLabel.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        movieTitleLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        addSubview(moviePubDateLabel)
        moviePubDateLabel.translatesAutoresizingMaskIntoConstraints = false
        moviePubDateLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
        moviePubDateLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        moviePubDateLabel.leftAnchor.constraint(equalTo: movieTitleLabel.rightAnchor, constant: 10).isActive = true
        
        addSubview(movieUserRatingLabel)
        movieUserRatingLabel.translatesAutoresizingMaskIntoConstraints = false
        movieUserRatingLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
        movieUserRatingLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        movieUserRatingLabel.leftAnchor.constraint(equalTo: moviePubDateLabel.rightAnchor, constant: 10).isActive = true
    }
    
    func configureUI(currentMovie: MovieListModel) {
        movieTitleLabel.text = currentMovie.title
        moviePubDateLabel.text = currentMovie.pubDate
        movieUserRatingLabel.text = currentMovie.userRating
    }
}
