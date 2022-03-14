//
//  PokeDetailTopView.swift
//  PokemonDictionary
//
//  Created by 이건준 on 2022/03/07.
//

import UIKit

class PokeDetailTopView: BaseView {
    
    let pokeImageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layout() {
        addSubview(pokeImageView)
        pokeImageView.translatesAutoresizingMaskIntoConstraints = false
        pokeImageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        pokeImageView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        pokeImageView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 4).isActive = true
        pokeImageView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 4).isActive = true
    }
    
    override func attribute() {
        pokeImageView.contentMode = .scaleAspectFit
        makeShadow(view: pokeImageView)
    }
}
