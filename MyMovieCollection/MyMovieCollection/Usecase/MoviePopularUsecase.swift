//
//  MoviePopularUsecase.swift
//  MyMovieCollection
//
//  Created by 이건준 on 2022/02/19.
//

import RxSwift

class MoviePopularUsecase {
    
    private let repository: MovieReqository
    
    init(repository: MovieReqository) {
        self.repository = repository
    }
    
    func fetchMoviePopularWithRxSwift() -> Observable<Result<PopularMovieList, MovieError>> {
        return repository.fetchMoviePopularWithRxSwift()
    }
    
    func fetchMoviePopularModel(popularMovies: [PopularMovie]) -> [MoviePopularModel] {
        var moviePopularModels: [MoviePopularModel] = []
        _ = popularMovies.map { popularMovie in
            let moviePopularModel = MoviePopularModel(originalTitle: popularMovie.originalTitle ?? "", overview: popularMovie.overview ?? "", posterPath: setupImagePath(posterPath: popularMovie.posterPath), releaseDate: popularMovie.releaseDate ?? "", voteAverage: popularMovie.voteAverage ?? 0.0)
            moviePopularModels.append(moviePopularModel)
        }
        return moviePopularModels
    }
    
    private func setupImagePath(posterPath: String?) -> String {
        guard let posterPath = posterPath else { return "" }
        return "https://image.tmdb.org/t/p/w500\(posterPath)"
    }
}
