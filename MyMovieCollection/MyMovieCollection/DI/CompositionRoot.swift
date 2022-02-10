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
        
        let mainCoordinator: MainCoordinator = .init()
        return .init(mainCoordinator: mainCoordinator)
    }
}
