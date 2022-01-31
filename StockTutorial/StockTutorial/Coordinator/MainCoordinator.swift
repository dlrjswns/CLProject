//
//  MainController.swift
//  StockTutorial
//
//  Created by 이건준 on 2022/02/01.
//

import UIKit

class MainCoordinator:Coordinator{
    var navigationController: UINavigationController?
    
    func start() {
        let rootViewController = StockListController()
        navigationController?.setViewControllers([rootViewController], animated: false)
    }
    
    
}
