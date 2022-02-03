//
//  StockUseCase.swift
//  StockTutorial
//
//  Created by 이건준 on 2022/02/01.
//

import Foundation
import Combine
import RxSwift

class StockUseCase { //MVVM에서의 Service같은 역할
                     //UseCase에서 원하는 View에 해당하는 Model로 파싱하기위한 메소드를 지정해주고 viewModel에서 그 파싱하는 메소드를 사용하는 방식으로
    func fetchStocksPublisher(keyword: String) -> AnyPublisher<StockResult, Error>{
        return stockRepository.fetchStocksPublisher(keyword: keyword)
    }
    
//    func fetchStocksPublisher(keyword: String) -> Observable<[StockListView.Data]>{
//        return Observable.create { [weak self] emitter in
//            self?.stockRepository.fetchStocksRxSwift(keyword: keyword).map { result in
//                switch result{
//                    case .success(let stockResult):
//
//                    case .failure(let stockError):
//                        print("StockUseCase - failed = \(stockError.localizedDescription)")
//                    }
//            }
//
//            return Disposables.create()
//        }
//    }
    
    private let stockRepository: StockRepository
    
    init(stockRepository:StockRepository) {
        self.stockRepository = stockRepository
    }
}
