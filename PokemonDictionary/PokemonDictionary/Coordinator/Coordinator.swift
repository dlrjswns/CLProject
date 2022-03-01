//
//  Coordinator.swift
//  PokemonDictionary
//
//  Created by 이건준 on 2022/03/02.
//

import UIKit

protocol Coordinator {
    func start()
    var navigationController: UINavigationController? { get set }
}
