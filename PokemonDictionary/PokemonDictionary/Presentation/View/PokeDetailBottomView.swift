//
//  PokeDetailBottomView.swift
//  PokemonDictionary
//
//  Created by 이건준 on 2022/03/07.
//

import UIKit

class PokeDetailBottomView: BaseView {
    
    let pokeNameLabel = UILabel()
    let pokeTypeLabel = UILabel()
    let pokeDescriptionLabel = UILabel()
    let statTextLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layout() {
        addSubview(pokeNameLabel)
        pokeNameLabel.translatesAutoresizingMaskIntoConstraints = false
        pokeNameLabel.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        pokeNameLabel.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        pokeNameLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
        
        addSubview(pokeTypeLabel)
        pokeTypeLabel.translatesAutoresizingMaskIntoConstraints = false
        pokeTypeLabel.topAnchor.constraint(equalTo: pokeNameLabel.bottomAnchor).isActive = true
        pokeTypeLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
//        pokeTypeLabel.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
//        pokeTypeLabel.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        
        addSubview(pokeDescriptionLabel)
        pokeDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        pokeDescriptionLabel.topAnchor.constraint(equalTo: pokeTypeLabel.bottomAnchor).isActive = true
        pokeDescriptionLabel.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        pokeDescriptionLabel.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        
        addSubview(statTextLabel)
        statTextLabel.translatesAutoresizingMaskIntoConstraints = false
        statTextLabel.topAnchor.constraint(equalTo: pokeDescriptionLabel.bottomAnchor).isActive = true
        statTextLabel.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        statTextLabel.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        statTextLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
    override func attribute() {
        pokeNameLabel.textAlignment = .center
        pokeTypeLabel.textAlignment = .center
        pokeTypeLabel.layer.cornerRadius = 7
        pokeTypeLabel.clipsToBounds = true
        pokeDescriptionLabel.textAlignment = .center
        pokeDescriptionLabel.numberOfLines = .max
        statTextLabel.text = "Stat"
    }
    
    class pokeStatView: BaseView {
        
    }
}
