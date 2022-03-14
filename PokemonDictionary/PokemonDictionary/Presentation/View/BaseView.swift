//
//  BaseView.swift
//  PokemonDictionary
//
//  Created by 이건준 on 2022/03/02.
//

import UIKit

class BaseView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layout()
        attribute()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func layout() {
        
    }
    
    func attribute() {
        backgroundColor = .systemBackground
    }
    
//    func makeShadow(view: UIView) {
//        view.layer.shadowRadius = 1
//        view.layer.shadowOffset = CGSize(width: 1, height: 1)
//        view.layer.shadowOpacity = 1
//    }
}
