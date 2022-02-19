//
//  MovieRepository.swift
//  MyMovieCollection
//
//  Created by 이건준 on 2022/02/10.
//

import Combine
import RxSwift
import RxCocoa

class MovieRepositoryImpl: MovieReqository {
    
    private let session: URLSession
    
    init(session: URLSession = .shared) {
        self.session = session
    }
    
    func fetchMoviePopularWithRxSwift() -> Observable<Result<PopularMovieList, MovieError>>{
        guard let url = getMoviePopularURLComponents().url else {
            let error = MovieError.urlError
            return .just(.failure(error))
        }
        
        return session.rx.data(request: URLRequest(url: url)).map { data in
            do {
                let popularMovieList = try JSONDecoder().decode(PopularMovieList.self, from: data)
                return .success(popularMovieList)
            }catch {
                let error = MovieError.decodeError
                return .failure(error)
            }
        }
    }
    
    func fetchMovieListWithCombine(keyword: String) -> AnyPublisher<MovieList, MovieError> {
        let urlResult = getMovieListURLRequest(keyword: keyword)
        switch urlResult {
        case .failure(let error):
            return Fail(error: error).eraseToAnyPublisher()
        case .success(let urlRequest):
            return session.dataTaskPublisher(for: urlRequest).mapError { _ in
                MovieError.movieAPIError
            }.receive(on: DispatchQueue.main)
            .flatMap({ data in
                return Just(data.data).decode(type: MovieList.self, decoder: JSONDecoder()).mapError { _ in
                    MovieError.decodeError
                }
            })
            .eraseToAnyPublisher()
        }
    }
}

extension MovieRepositoryImpl {
    struct MovieAPI {
        static let scheme = "https"
        static let host = "openapi.naver.com"
        static let path = "/v1/search/movie.json"
        static let clientID = "o6h5Wlhgb309uisyslEX"
        static let clientSecret = "c1WvQUksjQ"
    }
    
    struct MyMovieDB {
        static let scheme = "https"
        static let host = "api.themoviedb.org"
        static let path = "/3/movie/popular"
    }
    
    func getMoviePopularURLComponents() -> URLComponents {
        var components = URLComponents()
        components.scheme = MyMovieDB.scheme
        components.host = MyMovieDB.host
        components.path = MyMovieDB.path
        components.queryItems = [
            URLQueryItem(name: "api_key", value: "5dfb363e92ea551484beb33ec87c3cb2")
        ]
        return components
    }
    
    func getMovieListURLRequest(keyword: String) -> Result<URLRequest, MovieError> {
        guard let url = getMovieListURLComponents(keyword: keyword).url else {
            let error = MovieError.urlError
            return .failure(error)
        }
        
        var components: URLRequest = .init(url: url)
        components.allHTTPHeaderFields = [
            "X-Naver-Client-Id" : MovieAPI.clientID,
            "X-Naver-Client-Secret" : MovieAPI.clientSecret
        ]
        
        return .success(components)
        
    }
    
    private func getMovieListURLComponents(keyword: String) -> URLComponents {
        var components: URLComponents = .init()
        components.scheme = MovieAPI.scheme
        components.host = MovieAPI.host
        components.path = MovieAPI.path
        
        components.queryItems = [
            URLQueryItem(name: "query", value: keyword)
        ]
        
        return components
    }
}
