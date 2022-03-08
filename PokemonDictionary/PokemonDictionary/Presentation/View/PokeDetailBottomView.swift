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
    let statAttackView = PokeStatView()
    let statDefenseView = PokeStatView()
    let statHeightView = PokeStatView()
    let statWeightView = PokeStatView()
    
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
        
        addSubview(pokeDescriptionLabel)
        pokeDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        pokeDescriptionLabel.topAnchor.constraint(equalTo: pokeTypeLabel.bottomAnchor).isActive = true
        pokeDescriptionLabel.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        pokeDescriptionLabel.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        
        addSubview(statTextLabel)
        statTextLabel.translatesAutoresizingMaskIntoConstraints = false
        statTextLabel.topAnchor.constraint(equalTo: pokeDescriptionLabel.bottomAnchor, constant: 10).isActive = true
        statTextLabel.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        statTextLabel.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        
        addSubview(statAttackView)
        statAttackView.translatesAutoresizingMaskIntoConstraints = false
        statAttackView.topAnchor.constraint(equalTo: statTextLabel.bottomAnchor).isActive = true
        statAttackView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        statAttackView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        
        addSubview(statDefenseView)
        statDefenseView.translatesAutoresizingMaskIntoConstraints = false
        statDefenseView.topAnchor.constraint(equalTo: statAttackView.bottomAnchor).isActive = true
        statDefenseView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        statDefenseView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        
        addSubview(statHeightView)
        statHeightView.translatesAutoresizingMaskIntoConstraints = false
        statHeightView.topAnchor.constraint(equalTo: statDefenseView.bottomAnchor).isActive = true
        statHeightView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        statHeightView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        
        addSubview(statWeightView)
        statWeightView.translatesAutoresizingMaskIntoConstraints = false
        statWeightView.topAnchor.constraint(equalTo: (statHeightView).bottomAnchor).isActive = true
        statWeightView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        statWeightView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        statWeightView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -90).isActive = true
        
    }
    
    override func attribute() {
        pokeNameLabel.textAlignment = .center
        pokeNameLabel.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        pokeTypeLabel.textAlignment = .center
        pokeTypeLabel.layer.cornerRadius = 7
        pokeTypeLabel.clipsToBounds = true
        pokeDescriptionLabel.textAlignment = .center
        pokeDescriptionLabel.numberOfLines = .max
        statTextLabel.text = "Stats"
        statTextLabel.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        statAttackView.pokeStatNameLabel.text = "Attack"
        statDefenseView.pokeStatNameLabel.text = "Defense"
        statHeightView.pokeStatNameLabel.text = "Height"
        statWeightView.pokeStatNameLabel.text = "Weight"
    }
    
    class PokeStatView: BaseView {
        
        let pokeStatNameLabel = UILabel()
        let pokeStatCountLabel = UILabel()
        let pokeStatProgressBar = UIProgressView(progressViewStyle: .bar)
        
        var pokeStat: Int = 0 {
            didSet{
                pokeStatCountLabel.text = "\(pokeStat)"
                
                UIView.animate(withDuration: 300) { [weak self] in
                    guard let self = self else { return }
                    self.pokeStatProgressBar.setProgress(Float(self.pokeStat) * 0.01, animated: true)
                }
            }
        }
        
        override init(frame: CGRect) {
            super.init(frame: frame)
//            pokeStatNameLabel.text = "dfdf"
//            pokeStatCountLabel.text = "100"
//            pokeStatProgressBar.progress = 0.5
//            pokeStatProgressBar.setProgress(0.1, animated: true)
            pokeStatProgressBar.trackTintColor = UIColor.systemGray
            pokeStatProgressBar.progressTintColor = UIColor.systemBlue
            pokeStatProgressBar.layer.cornerRadius = 10
            pokeStatProgressBar.clipsToBounds = true
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        override func layout() {
            addSubview(pokeStatNameLabel)
            pokeStatNameLabel.translatesAutoresizingMaskIntoConstraints = false
            pokeStatNameLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
            pokeStatNameLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 10).isActive = true
            pokeStatNameLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
            
            addSubview(pokeStatCountLabel)
            pokeStatCountLabel.translatesAutoresizingMaskIntoConstraints = false
            pokeStatCountLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
            pokeStatCountLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
            pokeStatCountLabel.leftAnchor.constraint(equalTo: pokeStatNameLabel.rightAnchor, constant: 10).isActive = true
            
            addSubview(pokeStatProgressBar)
            pokeStatProgressBar.translatesAutoresizingMaskIntoConstraints = false
            pokeStatProgressBar.topAnchor.constraint(equalTo: topAnchor).isActive = true
            pokeStatProgressBar.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
            pokeStatProgressBar.leftAnchor.constraint(equalTo: pokeStatCountLabel.rightAnchor, constant: 10).isActive = true
            pokeStatProgressBar.rightAnchor.constraint(equalTo: rightAnchor, constant: -10).isActive = true

        }
        
        override func attribute() {
            pokeStatNameLabel.textColor = .systemGray
            pokeStatNameLabel.font = UIFont.systemFont(ofSize: 15)
        }
    }
}
