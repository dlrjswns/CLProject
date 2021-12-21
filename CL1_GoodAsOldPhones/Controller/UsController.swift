//
//  UsController.swift
//  CL1_GoodAsOldPhones
//
//  Created by 이건준 on 2021/12/03.
//

import UIKit

class UsController:UIViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBlue
        
        setTabBar()
    }
    
    func setTabBar(){ //UsController가 담당하는 탭바세팅
        self.tabBarItem.title = "Us"
    }
}
