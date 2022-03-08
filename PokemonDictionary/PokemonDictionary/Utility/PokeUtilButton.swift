//
//  PokeUtilButton.swift
//  PokemonDictionary
//
//  Created by 이건준 on 2022/03/08.
//

import UIKit

class PokeUtilButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureUI() {
        setTitle("PR", for: .normal)
        widthAnchor.constraint(equalToConstant: 70).isActive = true
        heightAnchor.constraint(equalToConstant: 70).isActive = true
        layer.cornerRadius = 35
        clipsToBounds = true
    }
}
