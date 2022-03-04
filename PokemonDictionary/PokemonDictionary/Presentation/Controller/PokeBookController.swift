//
//  PokeBookController.swift
//  PokemonDictionary
//
//  Created by 이건준 on 2022/03/02.
//

import UIKit

class PokeBookController: BaseViewController {
    
    let selfView: PokeBookView = PokeBookView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
        selfView.collectionView.backgroundColor = .systemBackground
        selfView.collectionView.delegate = self
        selfView.collectionView.dataSource = self
        selfView.collectionView.register(PokeBookCell.self, forCellWithReuseIdentifier: PokeBookCell.identifier)
    }
}
