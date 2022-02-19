//
//  MovieRepository.swift
//  MyMovieCollection
//
//  Created by 이건준 on 2022/02/10.
//


import Combine
import RxSwift

protocol MovieReqository {
    func fetchMovieListWithCombine(keyword: String) -> AnyPublisher<MovieList, MovieError>
    func fetchMoviePopularWithRxSwift() -> Observable<Result<PopularMovieList, MovieError>>
}

enum MovieError: Error {
    case urlError
    case decodeError
    case movieAPIError
    
    var errorMessage: String? {
        switch self {
        case .decodeError:
            return "Decode Error called"
        case .movieAPIError:
            return "MovieAPI Error called"
        case .urlError:
            return "MovieURL Error called"
        }
    }
}
