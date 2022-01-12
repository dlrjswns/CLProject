//
//  RootViewController.swift
//  MemberPR
//
//  Created by 이건준 on 2022/01/11.
//

import UIKit
import RxSwift
import RxCocoa

class RootViewController:UIViewController{
    var rootViewModel:RootViewModel = RootViewModel()
    var diposeBag = DisposeBag()
    
    lazy var foodName:UILabel={
       let lb = UILabel()
        lb.text = "초콜릿"
        return lb
    }()
    
    lazy var foodPrice:UILabel={
       let lb = UILabel()
        lb.text = "1482"
        return lb
    }()
    
    lazy var plusButton:UIButton={
        let btn = UIButton(type: UIButton.ButtonType.system)
        btn.setTitle("추가", for: UIControl.State.normal)
        btn.addTarget(self, action: #selector(tappedButton), for: UIControl.Event.touchUpInside)
        return btn
    }()
    
    lazy var minusButton:UIButton={
        let btn = UIButton(type: UIButton.ButtonType.system)
        btn.setTitle("삭제", for: UIControl.State.normal)
        btn.addTarget(self, action: #selector(tappedButton), for: UIControl.Event.touchUpInside)
        return btn
    }()
    
    lazy var totalPrice:UILabel={
       let lb = UILabel()
        lb.text = "0원"
        return lb
    }()
    
    lazy var totalCount:UILabel={
        let lb = UILabel()
        lb.text = "0개"
        return lb
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        
        rootViewModel.totalCount
            .map{ "\($0)개" }
            .bind(to: totalCount.rx.text)
            .disposed(by: diposeBag)
    }
    
    @objc func tappedButton(_ sender:UIButton){
        var changeCount:Int?
        
        switch sender.titleLabel?.text{
            case "추가":
                changeCount = +1
            case "삭제":
                changeCount = -1
            default:
                break
        }
        rootViewModel.changeCount(changeCount ?? 0)
    }
    
    func configureUI(){
        view.backgroundColor = .systemBackground
        view.addSubview(foodName)
        foodName.translatesAutoresizingMaskIntoConstraints = false
        foodName.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        foodName.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10).isActive = true
        
        view.addSubview(foodPrice)
        foodPrice.translatesAutoresizingMaskIntoConstraints = false
        foodPrice.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        foodPrice.leftAnchor.constraint(equalTo: foodName.rightAnchor, constant: 10).isActive = true
        
        view.addSubview(plusButton)
        plusButton.translatesAutoresizingMaskIntoConstraints = false
        plusButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        plusButton.leftAnchor.constraint(equalTo: foodPrice.rightAnchor, constant: 10).isActive = true
        
        view.addSubview(minusButton)
        minusButton.translatesAutoresizingMaskIntoConstraints = false
        minusButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        minusButton.leftAnchor.constraint(equalTo: plusButton.rightAnchor, constant: 10).isActive = true
        
        view.addSubview(totalPrice)
        totalPrice.translatesAutoresizingMaskIntoConstraints = false
        totalPrice.centerXAnchor.constraint(equalTo: foodPrice.centerXAnchor).isActive = true
        totalPrice.topAnchor.constraint(equalTo: foodPrice.bottomAnchor, constant: 10).isActive = true
        
        view.addSubview(totalCount)
        totalCount.translatesAutoresizingMaskIntoConstraints = false
        totalCount.centerYAnchor.constraint(equalTo: totalPrice.centerYAnchor).isActive = true
        totalCount.leftAnchor.constraint(equalTo: totalPrice.rightAnchor, constant: 10).isActive = true
    }
}
