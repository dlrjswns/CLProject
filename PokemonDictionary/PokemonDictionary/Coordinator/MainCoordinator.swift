//
//  MainCoordinator.swift
//  PokemonDictionary
//
//  Created by 이건준 on 2022/03/02.
//

import UIKit

class MainCoordinator: Coordinator {
    
    struct Dependency {
        let pokeBookViewControllerFactory: () -> PokeBookController
    }
    
    init(dependency: Dependency) {
        self.pokeBookViewControllerFactory = dependency.pokeBookViewControllerFactory
    }
    
    var navigationController: UINavigationController?
    
    let pokeBookViewControllerFactory: () -> PokeBookController
    
    func start() {
        let rootViewController = pokeBookViewControllerFactory()
        navigationController?.setViewControllers([rootViewController], animated: true)
    }
}
