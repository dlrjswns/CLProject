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
    let visualEffectView = UIVisualEffectView()
    
    var currentPokeType: PokeType = .normal {
        didSet{
            switch currentPokeType {
                case .bug:
                    backgroundColor = .systemGreen
                case .dragon:
                    backgroundColor = .systemTeal
                case .electric:
                    backgroundColor = .systemYellow
                case .fighting:
                    backgroundColor = .purple
                case .fire:
                    backgroundColor = .systemRed
                case .flying:
                    backgroundColor = .blue
                case .grass:
                    backgroundColor = .systemPurple
                case .ground:
                    backgroundColor = .brown
                case .ice:
                    backgroundColor = .systemBlue
                case .normal:
                    backgroundColor = .systemOrange
                case .poison:
                    backgroundColor = .systemGreen
                case .psychic:
                    backgroundColor = .systemGray3
                case .water:
                    backgroundColor = .systemBlue
                case .rock:
                    backgroundColor = .systemPurple
                case .fairy:
                    backgroundColor = .systemPink
                case .steel:
                    backgroundColor = .systemGray6
            }
        }
    }
    
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
        pokeImageView.rightAnchor.constraint(equalTo: rightAnchor, constant: 10).isActive = true
        pokeImageView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        pokeImageView.widthAnchor.constraint(equalToConstant: (frame.width / 3) * 2).isActive = true
        pokeImageView.heightAnchor.constraint(equalToConstant: (frame.height / 3) * 2).isActive = true
        
        addSubview(pokeNameLabel)
        pokeNameLabel.translatesAutoresizingMaskIntoConstraints = false
        pokeNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        pokeNameLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 10).isActive = true
        
        addSubview(pokeTypeLabel)
        pokeTypeLabel.translatesAutoresizingMaskIntoConstraints = false
        pokeTypeLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 10).isActive = true
        pokeTypeLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10).isActive = true
        
        pokeTypeLabel.addSubview(visualEffectView)
        visualEffectView.translatesAutoresizingMaskIntoConstraints = false
        visualEffectView.topAnchor.constraint(equalTo: pokeTypeLabel.topAnchor).isActive = true
        visualEffectView.leftAnchor.constraint(equalTo: pokeTypeLabel.leftAnchor).isActive = true
        visualEffectView.rightAnchor.constraint(equalTo: pokeTypeLabel.rightAnchor).isActive = true
        visualEffectView.bottomAnchor.constraint(equalTo: pokeTypeLabel.bottomAnchor).isActive = true
    }
    
    func attribute() {
        backgroundColor = .systemRed
        layer.cornerRadius = 10
        
        let blurEffect = UIBlurEffect(style: .light)
        visualEffectView.effect = blurEffect
    }
    
    func configureUI(item: PokeBookModel) {
        pokeImageView.fetchImage(imageUrl: item.imageUrl)
        pokeNameLabel.text = item.name.fetchFirstUpperCased()
        pokeTypeLabel.text = item.type.toString
        currentPokeType = item.type
    }
}

extension PokeBookCell {
    class PokeImageView: UIImageView {
        
        override init(frame: CGRect = .zero) {
            super.init(frame: frame)
            contentMode = .scaleAspectFit
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }
    
    class PokeNameLabel: UILabel {
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            textColor = .white
            font = UIFont.boldSystemFont(ofSize: 17)
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }
    
    class PokeTypeLabel: UILabel {
        
//        let visualEffectView = UIVisualEffectView()
        
        override init(frame: CGRect) {
            super.init(frame: frame)
//            layout()
            attribute()
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
//        func layout() {
//            addSubview(visualEffectView)
//            visualEffectView.translatesAutoresizingMaskIntoConstraints = false
//            visualEffectView.topAnchor.constraint(equalTo: topAnchor).isActive = true
//            visualEffectView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
//            visualEffectView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
//            visualEffectView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
//        }
        
        func attribute() {
            textColor = .white
            layer.cornerRadius = 10
//            layer.borderWidth = 1
//            layer.borderColor = UIColor.white.cgColor
            
//            let visualEffect = UIBlurEffect(style: .regular)
//            visualEffectView.effect = visualEffect
//            visualEffectView.layer.cornerRadius = 10
//            visualEffectView.alpha = 1
        }
    }
}
