//
//  PokeDetailView.swift
//  PokemonDictionary
//
//  Created by 이건준 on 2022/03/06.
//

import UIKit

class PokeDetailView: BaseView {
    
    let pokeDetailTopView = PokeDetailTopView()
    let pokeDetailBottomView = PokeDetailBottomView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layout() {
        addSubview(pokeDetailTopView)
        pokeDetailTopView.translatesAutoresizingMaskIntoConstraints = false
        pokeDetailTopView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        pokeDetailTopView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        pokeDetailTopView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        
        addSubview(pokeDetailBottomView)
        pokeDetailBottomView.translatesAutoresizingMaskIntoConstraints = false
        pokeDetailBottomView.topAnchor.constraint(equalTo: pokeDetailTopView.bottomAnchor, constant: -10).isActive = true
        pokeDetailBottomView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        pokeDetailBottomView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        pokeDetailBottomView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
    override func attribute() { 
        backgroundColor = .systemBackground
        pokeDetailBottomView.layer.cornerRadius = 10
        pokeDetailBottomView.clipsToBounds = true
    }
}
