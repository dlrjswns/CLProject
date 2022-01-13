//
//  NextViewController.swift
//  OrderList
//
//  Created by 이건준 on 2022/01/13.
//

import UIKit
import RxSwift

class NextViewController:UIViewController{
    var subject:BehaviorSubject<[String]> = BehaviorSubject(value: [])
    
    lazy var btn:UIButton={
        let btn = UIButton(type: UIButton.ButtonType.system)
        btn.setTitle("클릭", for: .normal)
        btn.addTarget(self, action: #selector(tappedButton), for: .touchUpInside)
        return btn
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(btn)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.widthAnchor.constraint(equalToConstant: 40).isActive = true
        btn.heightAnchor.constraint(equalToConstant: 40).isActive = true
        btn.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        btn.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        subject.subscribe(onNext: {print("onNext = \($0)")}, onError: {print("onError = \($0.localizedDescription)")}, onCompleted: {print("onCompleted")}, onDisposed: {print("onDisposed")})
    }
    
    @objc func tappedButton(){
        subject.onNext(["이", "rs", "준"])
        self.navigationController?.popViewController(animated: true)
    }
    
    func makeObservable()->Observable<[String]>{
        return Observable.create { stream in
            
            return Disposables.create()
        }
    }
}
