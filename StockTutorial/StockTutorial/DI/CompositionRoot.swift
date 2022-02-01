//
//  CompositionRoot.swift
//  StockTutorial
//
//  Created by 이건준 on 2022/02/01.
//

import Foundation
//메모리를 효율적으로 쓰기위해서 di를 할껀데 이를 하기위해서 의존성을 관리해주는 CompositionRoot를 만들어준다

struct AppDependency {
//    let coordinator:Coordinator
    let mainCoordinator: MainCoordinator
}

extension AppDependency{
    static func resolve() -> AppDependency {
        
        let stockRepository:StockRepository = StockRepositoryImpl()
        
        let stockListControllerFactory:() -> StockListController = {
            let usecase = StockUseCase(stockRepository: stockRepository)
            let viewModel = StockListViewModel(usecase: usecase)
            return .init(dependency: .init(viewModel: viewModel))
        }
        let mainCoordinator:MainCoordinator = .init(dependency: .init(stockListControllerFactory: stockListControllerFactory))
        
        return .init(mainCoordinator: mainCoordinator)
        
//        let coordinator: Coordinator = .init()
//
//        return .init(coordinator: coordinator)
    }
}
