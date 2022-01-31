//
//  Coordinator.swift
//  StockTutorial
//
//  Created by 이건준 on 2022/02/01.
//

import UIKit

protocol Coordinator {
    var navigationController:UINavigationController? { get set }
    func start()
}
//class Coordinator{
//    func start(window:UIWindow, rootViewController:UIViewController){
//        let rootViewController = UINavigationController(rootViewController: rootViewController)
//        window.rootViewController = rootViewController
//        window.makeKeyAndVisible()
//    }
//}
