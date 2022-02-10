//
//  MovieListUsecase.swift
//  MyMovieCollection
//
//  Created by 이건준 on 2022/02/10.
//

import Combine

class MovieListUsecase {
    
    private let repository: MovieReqository
    
    init(repository: MovieReqository) {
        self.repository = repository
    }
    
    func fetchMovieListWithCombine(keyword: String) -> AnyPublisher<MovieList, MovieError> {
        print("MovieListUsecase fetchMovieListWithCombine() called")
        return repository.fetchMovieListWithCombine(keyword: keyword)
    }
    
    func fetchMovieListModel(movies: [Movie]?) -> [MovieListModel] {
        var movieListModels: [MovieListModel] = []
        if let movies = movies {
            _ = movies.map { movie in
                let movie = MovieListModel(title: movie.title, image: movie.image, subtitle: movie.subtitle, pubDate: movie.pubDate, director: movie.director, actor: movie.actor)
                movieListModels.append(movie)
            }
        }
        return movieListModels
    }
}
