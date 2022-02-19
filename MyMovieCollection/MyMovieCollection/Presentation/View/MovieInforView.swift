//
//  MovieInforView.swift
//  MyMovieCollection
//
//  Created by 이건준 on 2022/02/20.
//

import UIKit

class MovieInforView: BaseView {
    
    let scrollView = UIScrollView()
    let movieThumbnailView = UIImageView()
    let movieTitleLabel = NormalBoldLabel()
    let releaseDateLabel = NormalBoldLabel()
    let voteAverageLabel = NormalBoldLabel()
    let movieOverviewLabel = NormalBoldLabel()
    
    override func configureUI() {
        //dummy data
//        movieThumbnailView.image = UIImage(systemName: "heart.fill")
//        releaseDateLabel.text = "2022-02-20"
//        voteAverageLabel.text = "⭐️ 8.5"
//        movieOverviewLabel.text = "이 영화는 꿀잼이다"
        
        backgroundColor = .systemBackground
        
        addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        scrollView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        scrollView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        scrollView.addSubview(movieThumbnailView)
        movieThumbnailView.translatesAutoresizingMaskIntoConstraints = false
        movieThumbnailView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        movieThumbnailView.leftAnchor.constraint(equalTo: scrollView.leftAnchor).isActive = true
        movieThumbnailView.rightAnchor.constraint(equalTo: scrollView.rightAnchor).isActive = true

        scrollView.addSubview(movieTitleLabel)
        movieTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        movieTitleLabel.topAnchor.constraint(equalTo: movieThumbnailView.bottomAnchor).isActive = true
        movieTitleLabel.leftAnchor.constraint(equalTo: scrollView.leftAnchor).isActive = true
        movieTitleLabel.rightAnchor.constraint(equalTo: scrollView.rightAnchor).isActive = true

        scrollView.addSubview(releaseDateLabel)
        releaseDateLabel.translatesAutoresizingMaskIntoConstraints = false
        releaseDateLabel.topAnchor.constraint(equalTo: movieTitleLabel.bottomAnchor).isActive = true
        releaseDateLabel.leftAnchor.constraint(equalTo: scrollView.leftAnchor).isActive = true
        releaseDateLabel.rightAnchor.constraint(equalTo: scrollView.rightAnchor).isActive = true

        scrollView.addSubview(voteAverageLabel)
        voteAverageLabel.translatesAutoresizingMaskIntoConstraints = false
        voteAverageLabel.topAnchor.constraint(equalTo: releaseDateLabel.bottomAnchor).isActive = true
        voteAverageLabel.leftAnchor.constraint(equalTo: scrollView.leftAnchor).isActive = true
        voteAverageLabel.rightAnchor.constraint(equalTo: scrollView.rightAnchor).isActive = true

        scrollView.addSubview(movieOverviewLabel)
        movieOverviewLabel.translatesAutoresizingMaskIntoConstraints = false
        movieOverviewLabel.topAnchor.constraint(equalTo: voteAverageLabel.bottomAnchor).isActive = true
        movieOverviewLabel.leftAnchor.constraint(equalTo: scrollView.leftAnchor).isActive = true
        movieOverviewLabel.rightAnchor.constraint(equalTo: scrollView.rightAnchor).isActive = true
        movieOverviewLabel.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
    }
    
    func configureUI(moviePopularModel: MoviePopularModel) {
        movieThumbnailView.loadImage(imageUrl: moviePopularModel.posterPath)
//        movieThumbnailView.contentMode = .scaleAspectFit
        movieThumbnailView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width).isActive = true
        movieTitleLabel.text = moviePopularModel.originalTitle
        releaseDateLabel.text = moviePopularModel.releaseDate
        voteAverageLabel.text = "⭐️\(moviePopularModel.voteAverage)"
        movieOverviewLabel.text = moviePopularModel.overview
        movieOverviewLabel.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width).isActive = true
        movieOverviewLabel.numberOfLines = 5
//        movieOverviewLabel.numberOfLines = .max  -> 이 코드를 더보기 버튼을 누르면 해준다던지 이런식으로 UX에 대한 추가를 해주면 좋을듯
    }
    
}
