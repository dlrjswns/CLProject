//
//  CompositionRoot.swift
//  MyMovieCollection
//
//  Created by 이건준 on 2022/02/10.
//

import Foundation

struct AppDependency {
    let mainCoordinator: MainCoordinator
}

extension AppDependency {
    static func resolve() -> AppDependency {
        
        let movieRepository: MovieReqository = MovieRepositoryImpl()
        let movieListControllerFactory: () -> MovieListController = {
            return .init(viewModel: .init(usecase: .init(repository: movieRepository)))
        }
        
        let movieDetailControllerFactory: (MovieListModel) -> MovieDetailController = { movieListModel in
            return .init(dependency: .init(currentMovieListModel: movieListModel))
        }
        
        let mainCoordinator: MainCoordinator = .init(dependency: .init(movieListControllerFactory: movieListControllerFactory, movieDetailControllerFactory: movieDetailControllerFactory))
        return .init(mainCoordinator: mainCoordinator)
    }
}
