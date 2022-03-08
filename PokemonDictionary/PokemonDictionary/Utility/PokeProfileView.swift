//
//  PokeProfileView.swift
//  PokemonDictionary
//
//  Created by 이건준 on 2022/03/08.
//

import UIKit

class PokeProfileView: BaseView {
    
    let pokeImageView = UIImageView()
    let pokeNameLabel = UILabel()
    let pokeTypeLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 3).isActive = true
        heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 3).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layout() {
        addSubview(pokeImageView)
        pokeImageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        pokeImageView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        pokeImageView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        pokeImageView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 4).isActive = true
        pokeImageView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 4).isActive = true
        pokeImageView.image = UIImage(systemName: "person.fill")
        
        addSubview(pokeNameLabel)
        pokeNameLabel.translatesAutoresizingMaskIntoConstraints = false
        pokeNameLabel.topAnchor.constraint(equalTo: pokeImageView.bottomAnchor).isActive = true
        pokeNameLabel.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        pokeNameLabel.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        pokeNameLabel.text = "dfdf"
        
        addSubview(pokeTypeLabel)
        pokeTypeLabel.translatesAutoresizingMaskIntoConstraints = false
        pokeTypeLabel.topAnchor.constraint(equalTo: pokeNameLabel.bottomAnchor).isActive = true
        pokeTypeLabel.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        pokeTypeLabel.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        pokeTypeLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        pokeTypeLabel.text = "dfdf"
    }
    
    override func attribute() {
        backgroundColor = .systemBackground
        layer.cornerRadius = UIScreen.main.bounds.width / 6
        clipsToBounds = true
        pokeImageView.contentMode = .scaleAspectFit
        pokeNameLabel.textAlignment = .center
        pokeNameLabel.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        pokeTypeLabel.textAlignment = .center
        pokeTypeLabel.layer.cornerRadius = 7
        pokeTypeLabel.clipsToBounds = true
    }
}
