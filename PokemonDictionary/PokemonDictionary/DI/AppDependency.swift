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
        
        let pokeBookViewModelFactory: () -> PokeBookViewModel = {
            .init(usecase: .init(repository: pokeBookRepository))
        }
        
        let pokeBookViewControllerFactory: () -> PokeBookController = {
            return .init(viewModel: pokeBookViewModelFactory())
        }
        
        let pokeDetailViewControllerFactory: (PokeBookModel) -> PokeDetailController = { pokeBookModel in
            return .init(dependency: .init(currentPokeBookModel: pokeBookModel))
        }
        
        return .init(mainCoordinator: .init(dependency: .init(pokeBookViewControllerFactory: pokeBookViewControllerFactory, pokeDetailViewControllerFactory: pokeDetailViewControllerFactory)))
    }
}
