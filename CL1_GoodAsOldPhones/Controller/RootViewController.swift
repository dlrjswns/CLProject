//
//  RootViewController.swift
//  CL1_GoodAsOldPhones
//
//  Created by 이건준 on 2021/12/03.
//

import UIKit

class RootViewController:UITabBarController{
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setTabBarController()
    }
    
    func setTabBarController(){ //탭바를 설정하기위한 함수
        let vc = [UINavigationController(rootViewController: ProductController()), UsController()]
        self.setViewControllers(vc, animated: true)
    }
}
