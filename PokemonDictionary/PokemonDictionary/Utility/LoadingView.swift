//
//  LoadingView.swift
//  PokemonDictionary
//
//  Created by 이건준 on 2022/03/08.
//

import Lottie
import UIKit

class LoadingView: UIView {
    
    let animationView = AnimationView(name: "pikachuLoading")
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .placeholderText
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .loop
        animationView.animationSpeed = 0.5
        animationView.play()
        
        addSubview(animationView)
        animationView.translatesAutoresizingMaskIntoConstraints = false
        animationView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        animationView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        animationView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 3).isActive = true
        animationView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 3).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
