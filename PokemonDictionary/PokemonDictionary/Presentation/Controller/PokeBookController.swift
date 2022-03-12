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
    
    var coordinator: MainCoordinator?
    
    init(viewModel: PokeBookViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.fetchInput.onNext(())
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        viewModel.fetchInput.onNext(())
        
        viewModel.pokeModelOutput.asObservable().bind(to: selfView.collectionView.rx.items(cellIdentifier: PokeBookCell.identifier, cellType: PokeBookCell.self)){ index, item, cell in
            cell.configureUI(item: item)
        }.disposed(by: disposeBag)
        
        viewModel.emptyOutput.drive(onNext: { [weak self] isEmpty in
            self?.selfView.loadingView.isHidden = !isEmpty
        }).disposed(by: disposeBag)
        
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
        navigationItem.largeTitleDisplayMode = .always
        selfView.collectionView.backgroundColor = .systemBackground
        selfView.collectionView.delegate = self
        selfView.collectionView.register(PokeBookCell.self, forCellWithReuseIdentifier: PokeBookCell.identifier)
        
        
        selfView.pokeUtilButton.addItem(title: nil, image: UIImage(named: "Fire"), action: { [weak self] _ in self?.viewModel.fireFetchInput.onNext(())} )
        selfView.pokeUtilButton.addItem(title: nil, image: UIImage(named: "Water"), action: nil)
        selfView.pokeUtilButton.addItem(title: nil, image: UIImage(named: "Glass"), action: nil)
        selfView.pokeUtilButton.addItem(title: nil, image: UIImage(named: "Electric"), action: nil)
    }
    
}
