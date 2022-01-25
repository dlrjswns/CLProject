//
//  ViewModelBindableType.swift
//  RxMemo
//
//  Created by 이건준 on 2022/01/25.
//

import UIKit

protocol ViewModelBindableType { //ViewModel의 타입은 ViewController에 따라 달라지기때문에 프로토콜을 제네릭프로토콜로 선언해야한다
    associatedtype ViewModelType
    
    var viewModel:ViewModelType! { get set }
    func bindViewModel()
}

extension ViewModelBindableType where Self: UIViewController{
    mutating func bind(viewModel: Self.ViewModelType){
        self.viewModel = viewModel
        loadViewIfNeeded()
        
        bindViewModel()
    }
}
