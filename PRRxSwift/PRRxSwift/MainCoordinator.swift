//
//  Coordinator.swift
//  PRRxSwift
//
//  Created by 이건준 on 2022/01/02.
//

import UIKit
import Pure

class MainCoordinator:FactoryModule{
    required init(dependency: Dependency, payload: ()) {
        rootViewController = dependency.rootViewController1()
    }
    
    struct Dependency {
        let rootViewController1:()->RootViewController1
    }
    
    let rootViewController:RootViewController1
    var navigationController:UINavigationController?
    
//    let window:UIWindow
//
//    init(window:UIWindow) {
//        self.window = window
//    }
//
//    func start(){
////        let rootViewController = ArticleViewController(viewModel: ArticleViewModel(articleService: ArticleService()))
//        let rootViewController = RootViewController1()
//
//        let navigationRootViewController = UINavigationController(rootViewController: rootViewController)
//
//        window.rootViewController = navigationRootViewController
//        window.makeKeyAndVisible()
//
//
//    }
//    let coordinator:MainCoordinator
    
    func start(){
        navigationController?.setViewControllers([rootViewController], animated: true)
    }
    
}
