//
//  PPViewController.swift
//  PRRxSwift
//
//  Created by 이건준 on 2022/02/28.
//

import UIKit
import RxSwift
import RxCocoa

class PPViewController: UIViewController {
    
    let textField = UITextField()
    let button = UIButton(type: .system)
    var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
        attribute()
        bind()
    }
    
    func attribute() {
        view.backgroundColor = .systemBackground
        button.setTitle("테스트", for: .normal)
        textField.placeholder = "입력하는곳"
    }
    
    func layout() {
        view.addSubview(textField)
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        textField.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.centerXAnchor.constraint(equalTo: textField.centerXAnchor).isActive = true
        button.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 10).isActive = true
    }
    
    func bind() {
        textField.rx.text.throttle(.seconds(7), latest: false, scheduler: MainScheduler.instance).subscribe(onNext: { str in
            print("thrText = \(str)")
        }).disposed(by: disposeBag)
        
        textField.rx.text.debounce(.seconds(7), scheduler: MainScheduler.instance).subscribe(onNext: { str in
            print("debounceText = \(str)")
        }).disposed(by: disposeBag)
        
        button.rx.tap.throttle(.seconds(7), latest: true, scheduler: MainScheduler.instance).subscribe(onNext: { tap in
            print("throttleTap")
        }).disposed(by: disposeBag)
        
//        button.rx.tap.debounce(.milliseconds(300), scheduler: MainScheduler.instance).subscribe(onNext: { tap in
//            print("debounceTap")
//        }).disposed(by: disposeBag)
    }
}
