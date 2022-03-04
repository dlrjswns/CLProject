//
//  PokeBookCell.swift
//  PokemonDictionary
//
//  Created by 이건준 on 2022/03/04.
//

import UIKit

class PokeBookCell: UICollectionViewCell {

    static let identifier = "PokebookCell"
    
    let pokeImageView = PokeImageView()
    let pokeNameLabel = PokeNameLabel()
    let pokeTypeLabel = PokeTypeLabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .systemRed
        layout()
        attribute()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func layout() {
        addSubview(pokeImageView)
        pokeImageView.translatesAutoresizingMaskIntoConstraints = false
        pokeImageView.rightAnchor.constraint(equalTo: rightAnchor, constant: -5).isActive = true
        pokeImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5).isActive = true
        
        addSubview(pokeNameLabel)
        pokeNameLabel.translatesAutoresizingMaskIntoConstraints = false
        pokeNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5).isActive = true
        pokeNameLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 5).isActive = true
        
        addSubview(pokeTypeLabel)
        pokeTypeLabel.translatesAutoresizingMaskIntoConstraints = false
        pokeTypeLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 5).isActive = true
        pokeTypeLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5).isActive = true
    }
    
    func attribute() {
        backgroundColor = .systemRed
        layer.cornerRadius = 10
        //dummy data
        pokeImageView.image = UIImage(systemName: "person.fill")
        pokeNameLabel.text = "이건준"
        pokeTypeLabel.text = "공격"
    }
}

extension PokeBookCell {
    class PokeImageView: UIImageView {
        
        override init(frame: CGRect = .zero) {
            super.init(frame: frame)
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }
    
    class PokeNameLabel: UILabel {
        
        override init(frame: CGRect) {
            super.init(frame: frame)
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }
    
    class PokeTypeLabel: UILabel {
        override init(frame: CGRect) {
            super.init(frame: frame)
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }
}
