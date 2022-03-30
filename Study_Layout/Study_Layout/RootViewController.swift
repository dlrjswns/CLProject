//
//  RootViewController.swift
//  Study_Layout
//
//  Created by 이건준 on 2022/03/30.
//

import UIKit

class RootViewController: UIViewController {
    
    private let selfView = RootView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        configureUI()
    }
    
    override func updateViewConstraints() { //이곳에 self.view의 Subview의 제약을 갱신하는 코드를 적음
        print("updateViewConstraints")
        super.updateViewConstraints()
    }
    
    func configureUI() {
        view.addSubview(selfView)
        selfView.translatesAutoresizingMaskIntoConstraints = false
        selfView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        selfView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        selfView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        selfView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    

}
