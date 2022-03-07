//
//  PokeDetailController.swift
//  PokemonDictionary
//
//  Created by 이건준 on 2022/03/06.
//

import UIKit

class PokeDetailController: BaseViewController {
    
    let selfView: PokeDetailView = .init()
    let currentPokeBookModel: PokeBookModel
    
    struct Dependency {
        let currentPokeBookModel: PokeBookModel
    }
    
    init(dependency: Dependency) {
        self.currentPokeBookModel = dependency.currentPokeBookModel
        super.init(nibName: nil, bundle: nil)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("currentPokemon = \(currentPokeBookModel)")
    }
    
    override func layout() {
        view.addSubview(selfView)
        selfView.translatesAutoresizingMaskIntoConstraints = false
        selfView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        selfView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        selfView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        selfView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    override func attribute() {
        selfView.pokeDetailTopView.backgroundColor = currentPokeBookModel.type.getPokeColor
        selfView.pokeDetailTopView.pokeImageView.fetchImage(imageUrl: currentPokeBookModel.imageUrl)
        selfView.pokeDetailBottomView.pokeNameLabel.text = currentPokeBookModel.name
        selfView.pokeDetailBottomView.pokeTypeLabel.text = currentPokeBookModel.type.toString
        selfView.pokeDetailBottomView.pokeDescriptionLabel.text = currentPokeBookModel.description
        selfView.pokeDetailBottomView.pokeTypeLabel.backgroundColor = currentPokeBookModel.type.getPokeColor
    }
}
