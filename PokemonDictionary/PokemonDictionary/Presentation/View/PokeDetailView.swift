//
//  PokeDetailView.swift
//  PokemonDictionary
//
//  Created by 이건준 on 2022/03/06.
//

import UIKit
import SnapKit

class PokeDetailView: BaseView {
    
    let pokeDetailTopView = PokeDetailTopView()
    let pokeDetailBottomView = PokeDetailBottomView()
    let pokeProfileView = PokeProfileView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layout() {
        addSubview(pokeDetailTopView)
//        pokeDetailTopView.translatesAutoresizingMaskIntoConstraints = false
//        pokeDetailTopView.topAnchor.constraint(equalTo: topAnchor).isActive = true
//        pokeDetailTopView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
//        pokeDetailTopView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        pokeDetailTopView.snp.makeConstraints { make in
            make.top.left.right.equalTo(self)
        }
        
        addSubview(pokeDetailBottomView)
//        pokeDetailBottomView.translatesAutoresizingMaskIntoConstraints = false
//        pokeDetailBottomView.topAnchor.constraint(equalTo: pokeDetailTopView.bottomAnchor).isActive = true
//        pokeDetailBottomView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
//        pokeDetailBottomView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
//        pokeDetailBottomView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        pokeDetailBottomView.snp.makeConstraints { make in
            make.top.equalTo(pokeDetailTopView.snp.bottom)
            make.left.right.bottom.equalTo(self)
        }
        
//        addSubview(pokeProfileView)
//        pokeProfileView.translatesAutoresizingMaskIntoConstraints = false
//        pokeProfileView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
//        pokeProfileView.topAnchor.constraint(equalTo: pokeDetailBottomView.topAnchor, constant: -50).isActive = true
    }
    
    override func attribute() { 
        backgroundColor = .systemBackground
        pokeDetailBottomView.layer.cornerRadius = 250
//        pokeDetailBottomView.clipsToBounds = true
//        bringSubviewToFront(pokeDetailBottomView)
    }
}
