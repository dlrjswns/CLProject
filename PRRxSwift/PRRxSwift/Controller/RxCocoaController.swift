//
//  RxCocoaController.swift
//  PRRxSwift
//
//  Created by 이건준 on 2022/01/08.
//

import UIKit
import RxCocoa
import RxSwift

class RxCocoaController:UIViewController{
    var viewModel:PublishSubject<String> = PublishSubject()
    var disposeBag:DisposeBag = DisposeBag()
    
    lazy var rxLabel:UILabel={
        let lb = UILabel()
        return lb
    }()
    
    lazy var rxButton:UIButton={
        let btn = UIButton(type: UIButton.ButtonType.system)
        btn.setTitle("10추가", for: UIControl.State.normal)
        btn.addTarget(self, action: #selector(rxButtonTapped), for: UIControl.Event.touchUpInside)
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        Observable.just("이건준")
            .reduce("") { <#A#>, <#String#> in
                <#code#>
            }
        viewModel
            .map({ str in
                str + "df"
            })
            .bind(to: rxLabel.rx.text)
            .disposed(by: disposeBag)
    }
    
    @objc func rxButtonTapped(){
        viewModel.onNext("이건준")
    }
    
    func configureUI(){
        view.backgroundColor = .systemBackground
        
        view.addSubview(rxLabel)
        rxLabel.translatesAutoresizingMaskIntoConstraints = false
        rxLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        rxLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        view.addSubview(rxButton)
        rxButton.translatesAutoresizingMaskIntoConstraints = false
        rxButton.centerXAnchor.constraint(equalTo: rxLabel.centerXAnchor).isActive = true
        rxButton.bottomAnchor.constraint(equalTo: rxLabel.topAnchor, constant: -10).isActive = true
    }
}
