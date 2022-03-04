//
//  PokeBookController.swift
//  PokemonDictionary
//
//  Created by 이건준 on 2022/03/02.
//

import UIKit
import RxSwift
import RxCocoa

class PokeBookController: BaseViewController {
    
    private let viewModel: PokeBookViewModel
    
    let selfView: PokeBookView = PokeBookView()
    
    init(viewModel: PokeBookViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.fetchInput.onNext(())
        
        viewModel.pokeModelOutput.asObservable().bind(to: selfView.collectionView.rx.items(cellIdentifier: PokeBookCell.identifier, cellType: PokeBookCell.self)){ item, index, cell in
            cell.pokeImageView.image = UIImage(systemName: "person.fill")
            cell.pokeNameLabel.text = "이건준"
            cell.pokeTypeLabel.text = "공격"
        }.disposed(by: disposeBag)
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
        title = "PokeBook"
        navigationController?.navigationBar.prefersLargeTitles = true
        selfView.collectionView.backgroundColor = .systemBackground
        selfView.collectionView.delegate = self
//        selfView.collectionView.dataSource = self
        selfView.collectionView.register(PokeBookCell.self, forCellWithReuseIdentifier: PokeBookCell.identifier)
    }
}
