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
        let pokeDetailViewControllerFactory: (PokeBookModel) -> PokeDetailController
    }
    
    init(dependency: Dependency) {
        self.rootViewController = dependency.pokeBookViewControllerFactory()
        self.pokeBookViewControllerFactory = dependency.pokeBookViewControllerFactory
        self.pokeDetailViewControllerFactory = dependency.pokeDetailViewControllerFactory
    }
    
    var navigationController: UINavigationController?
    
    let pokeBookViewControllerFactory: () -> PokeBookController
    let pokeDetailViewControllerFactory: (PokeBookModel) -> PokeDetailController
    let rootViewController: PokeBookController
    
    func start() {
        rootViewController.coordinator = self
        navigationController?.setViewControllers([rootViewController], animated: true)
    }
    
    func cellTapped(cellData: PokeBookModel) {
        let pokeDetailVC = pokeDetailViewControllerFactory(cellData)
        rootViewController.present(pokeDetailVC, animated: true, completion: nil)
    }
}
