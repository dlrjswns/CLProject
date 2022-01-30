//
//  Coordinator.swift
//  LoginValidation
//
//  Created by 이건준 on 2022/01/30.
//

import UIKit

class Coordinator{
    let window:UIWindow
    
    init(window:UIWindow) {
        self.window = window
    }
    
    func start(){
        window.rootViewController = LoginViewController()
        window.makeKeyAndVisible()
    }
}
