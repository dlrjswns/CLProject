//
//  BaseViewModel.swift
//  StockTutorial
//
//  Created by 이건준 on 2022/02/08.
//

import Combine

class BaseViewModel {
    var subscriber: Set<AnyCancellable> = .init()
    
    init() {
        subscriber = .init()
    }
}
