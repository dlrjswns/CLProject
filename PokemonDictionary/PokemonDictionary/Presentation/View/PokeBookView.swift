//
//  PokeBookView.swift
//  PokemonDictionary
//
//  Created by 이건준 on 2022/03/02.
//

import UIKit

class PokeBookView: BaseView {
   
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    let pokeMainButton = PokeUtilButton(type: .system)
    let pokeSubButton = PokeUtilButton(type: .system)
    let pokeSub1Button = PokeUtilButton(type: .system)
    let pokeSub2Button = PokeUtilButton(type: .system)
    
    override func layout() {
        addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        collectionView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        collectionView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        addSubview(pokeMainButton)
        pokeMainButton.translatesAutoresizingMaskIntoConstraints = false
        pokeMainButton.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        pokeMainButton.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        pokeMainButton.backgroundColor = .systemRed
        
//        addSubview(pokeSubButton)
//        pokeSubButton.translatesAutoresizingMaskIntoConstraints = false
//        pokeMainButton.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
//        pokeMainButton.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
//        pokeSubButton.centerXAnchor.constraint(equalTo: pokeMainButton.centerXAnchor).isActive = true
//        pokeSubButton.bottomAnchor.constraint(equalTo: pokeMainButton.topAnchor).isActive = true
    }
    
    override func attribute() {
//        pokeSubButton.isHidden = true
//        pokeSubButton.backgroundColor = .systemBlue
    }
}
