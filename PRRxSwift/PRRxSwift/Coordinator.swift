//
//  Coordinator.swift
//  PRRxSwift
//
//  Created by 이건준 on 2022/01/02.
//

import UIKit

class Coordinator{
    let window:UIWindow
    
    init(window:UIWindow) {
        self.window = window
    }
    
    func start(){
        let rootViewController = PRViewController()
        let navigationRootViewController = UINavigationController(rootViewController: rootViewController)
        window.rootViewController = navigationRootViewController
        window.makeKeyAndVisible()
        
        
    }
}
