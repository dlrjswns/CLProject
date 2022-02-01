//
//  StockListViewModel.swift
//  StockTutorial
//
//  Created by 이건준 on 2022/02/01.
//

import RxSwift
import Combine

class StockListViewModel{
    
    var errorMessage:BehaviorSubject<String?> = .init(value: nil)
    var stocks:BehaviorSubject<[Stock]> = .init(value: [])
    let usecase:StockUseCase
    
    init(usecase:StockUseCase) {
        self.usecase = usecase
    }
}
