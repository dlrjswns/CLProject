//
//  RootViewController1.swift
//  PRRxSwift
//
//  Created by 이건준 on 2022/01/02.
//

import UIKit

class RootViewController1:UIViewController{
    //MARK: -Properties
    
    //MARK: -Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    //MARK: -Configure
    func configureUI(){
        view.backgroundColor = .systemBackground
    }
}
