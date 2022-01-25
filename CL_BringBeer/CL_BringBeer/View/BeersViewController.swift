//
//  RootViewController.swift
//  CL_BringBeer
//
//  Created by 이건준 on 2022/01/20.
//

import UIKit
import RxSwift
import RxCocoa

class BeersViewController:UIViewController{
    let beerViewModel = BeerViewModel()
    let disposeBag = DisposeBag()
    
    lazy var button:UIButton={
        let btn = UIButton(type: .system)
        btn.setTitle("클릭", for: .normal)
        return btn
    }()
    
    lazy var tableView:UITableView={
       let tableView = UITableView()
        return tableView
    }()
    
    lazy var textField:UITextField={
       let tf = UITextField()
        tf.placeholder = "dfdsfsadf"
        tf.delegate = self
        return tf
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        tableView.register(BeerCell.self, forCellReuseIdentifier: BeerCell.identifier)
        configureUI()
        button.rx.tap
            .subscribe(onNext:{_ in
                print("tapped")
            })
            .disposed(by: disposeBag)
       
            
//        tableView.rx.estimatedRowHeight = 80
//        tableView.rx.rowHeight = UITableView.automaticDimension
//        tableView.rx.itemSelected
//            .subscribe(onNext:{_ in
//                print("tapped")
//            })
//            .disposed(by: disposeBag)
        tableView.rx.modelSelected(BeerModel.self)
            .subscribe(onNext:{ model in
                print("name = \(model.name)")
            })
            .disposed(by: disposeBag)
        bindBeerCell()
        tableView.estimatedRowHeight = 80
        tableView.rowHeight = UITableView.automaticDimension
        tableView.reloadData()
        
    }
    
    func bindBeerCell(){
        beerViewModel.beerRelay
            .bind(to: tableView.rx.items(cellIdentifier: BeerCell.identifier, cellType: BeerCell.self)){ [weak self]index, item, cell in
                guard let beerImage = self?.beerViewModel.fetchImageURL(imageUrl: item.imageURL) else {return}
                cell.beerID.text = String(describing: item.id)
                cell.beerImageView.image = beerImage
            }
            .disposed(by: disposeBag)
    }
    
    func configureUI(){
//        self.view = tableView
//        view.addSubview(button)
//        button.translatesAutoresizingMaskIntoConstraints = false
//        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//        button.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        view.backgroundColor = .systemBackground
        view.addSubview(textField)
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        textField.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
}

extension BeersViewController:UITextFieldDelegate{
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let text = textField.text else {return false}
        print("text = \(text)")
        let finalText = (text as NSString).replacingCharacters(in: range, with: string)
        print("finalText = \(finalText)")
        return true
    }
}
