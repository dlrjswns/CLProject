//
//  RootViewController.swift
//  OrderList
//
//  Created by 이건준 on 2022/01/13.
//

import UIKit

class RootViewController:UIViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        let btn = UIButton(type: UIButton.ButtonType.system)
        btn.setTitle("이동", for: .normal)
        btn.addTarget(self, action: #selector(tappedButton), for: .touchUpInside)
    
        view.addSubview(btn)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.widthAnchor.constraint(equalToConstant: 40).isActive = true
        btn.heightAnchor.constraint(equalToConstant: 40).isActive = true
        btn.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        btn.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    @objc func tappedButton(){
        self.navigationController?.pushViewController(NextViewController(), animated: true)
    }
}
