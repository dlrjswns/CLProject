//
//  AppDependency.swift
//  PokemonDictionary
//
//  Created by 이건준 on 2022/03/05.
//

import Foundation

struct AppDependency {
    let mainCoordinator: MainCoordinator
}

extension AppDependency {
    static func resolve() -> AppDependency {
        
        let pokeBookRepository = PokeBookRepositoryImpl()
        
        let pokeBookViewControllerFactory: () -> PokeBookController = {
            return .init(viewModel: .init(usecase: .init(repository: pokeBookRepository)))
        }
        
        return .init(mainCoordinator: .init(dependency: .init(pokeBookViewControllerFactory: pokeBookViewControllerFactory)))
    }
}
