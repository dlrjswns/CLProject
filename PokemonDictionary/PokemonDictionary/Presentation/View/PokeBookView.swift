//
//  PokeBookView.swift
//  PokemonDictionary
//
//  Created by 이건준 on 2022/03/02.
//

import UIKit
import JJFloatingActionButton

class PokeBookView: BaseView {
   
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    let loadingView = LoadingView()
    let pokeUtilButton = JJFloatingActionButton()
    
    override func layout() {
        addSubview(collectionView)
//        collectionView.translatesAutoresizingMaskIntoConstraints = false
//        collectionView.topAnchor.constraint(equalTo: topAnchor).isActive = true
//        collectionView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
//        collectionView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
//        collectionView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        addSubview(pokeUtilButton)
//        pokeUtilButton.translatesAutoresizingMaskIntoConstraints = false
//        pokeUtilButton.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
//        pokeUtilButton.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        pokeUtilButton.snp.makeConstraints { make in
            make.right.bottom.equalTo(self)
        }
        
        addSubview(loadingView)
//        loadingView.translatesAutoresizingMaskIntoConstraints = false
//        loadingView.topAnchor.constraint(equalTo: topAnchor).isActive = true
//        loadingView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
//        loadingView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
//        loadingView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        loadingView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    override func attribute() {
//        pokeUtilButton.addItem(title: nil, image: UIImage(named: "Fire"), action: nil)
//        pokeUtilButton.addItem(title: nil, image: UIImage(named: "Water"), action: nil)
//        pokeUtilButton.addItem(title: nil, image: UIImage(named: "Glass"), action: nil)
//        pokeUtilButton.addItem(title: nil, image: UIImage(named: "Electric"), action: nil)
        pokeUtilButton.buttonColor = .systemPurple
        pokeUtilButton.buttonImage = UIImage(named: "PokeLaunchImage")
        pokeUtilButton.highlightedButtonColor = .systemRed
        pokeUtilButton.shadowColor = .systemGray
        pokeUtilButton.itemAnimationConfiguration = .circularSlideIn(withRadius: 100)
        pokeUtilButton.buttonDiameter = 85
        
        makeShadow(view: pokeUtilButton)
        
    }
}
