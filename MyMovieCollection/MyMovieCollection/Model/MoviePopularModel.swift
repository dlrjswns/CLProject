//
//  MoviePopularModel.swift
//  MyMovieCollection
//
//  Created by 이건준 on 2022/02/19.
//

import Foundation

struct MoviePopularModel: Model {
    let originalTitle: String
    let overview: String
    let posterPath: String
    let releaseDate: String
    let voteAverage: Float
}
