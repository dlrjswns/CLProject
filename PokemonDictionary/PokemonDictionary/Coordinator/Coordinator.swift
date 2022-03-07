//
//  Coordinator.swift
//  PokemonDictionary
//
//  Created by 이건준 on 2022/03/02.
//

import UIKit

protocol Coordinator: AnyObject {
    func start()
    var navigationController: UINavigationController? { get set }
}
