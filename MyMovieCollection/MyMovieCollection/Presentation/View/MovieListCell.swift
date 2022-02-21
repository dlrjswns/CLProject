//
//  MovieListCell.swift
//  MyMovieCollection
//
//  Created by 이건준 on 2022/02/11.
//

import UIKit

class MovieListCell: UITableViewCell {
    static let identifier = "MovieListCell"
    
    let movieImageThumbnail = UIImageView()
    let movieTitleLabel = UILabel()
    let moviePubDateLabel = NormalBoldLabel()
    let movieUserRatingLabel = NormalBoldLabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setHighlighted(_ highlighted: Bool, animated: Bool) {
        if highlighted {
            alpha = 0.6
        }else {
            alpha = 1
        }
    }
    
    func configureUI() {
        addSubview(movieImageThumbnail)
        movieImageThumbnail.translatesAutoresizingMaskIntoConstraints = false
        movieImageThumbnail.topAnchor.constraint(equalTo: topAnchor).isActive = true
        movieImageThumbnail.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        movieImageThumbnail.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        movieImageThumbnail.contentMode = .scaleAspectFit
//        movieImageThumbnail.clipsToBounds = true
        
        addSubview(moviePubDateLabel)
        moviePubDateLabel.translatesAutoresizingMaskIntoConstraints = false
        moviePubDateLabel.topAnchor.constraint(equalTo: movieImageThumbnail.topAnchor).isActive = true
        moviePubDateLabel.leftAnchor.constraint(equalTo: movieImageThumbnail.rightAnchor, constant: 10).isActive = true
        
        addSubview(movieTitleLabel)
        movieTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        movieTitleLabel.leftAnchor.constraint(equalTo: moviePubDateLabel.leftAnchor).isActive = true
        movieTitleLabel.centerYAnchor.constraint(equalTo: movieImageThumbnail.centerYAnchor).isActive = true
        movieTitleLabel.lineBreakMode = .byTruncatingTail
        movieTitleLabel.widthAnchor.constraint(equalToConstant: 170).isActive = true
        
        addSubview(movieUserRatingLabel)
        movieUserRatingLabel.translatesAutoresizingMaskIntoConstraints = false
        movieUserRatingLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        movieUserRatingLabel.leftAnchor.constraint(equalTo: movieImageThumbnail.rightAnchor, constant: 10).isActive = true
    }
    
    func configureUI(currentMovie: MovieListModel) {
        movieImageThumbnail.loadImage(imageUrl: currentMovie.image)
        movieTitleLabel.text = currentMovie.title.removeBandSlashB()
        moviePubDateLabel.text = currentMovie.pubDate
        movieUserRatingLabel.text = "⭐️" + currentMovie.userRating
        accessoryType = .disclosureIndicator
        selectionStyle = .none
        layer.cornerRadius = 30
        layer.borderWidth = 1
        clipsToBounds = true
    }
}
