//
//  StockUseCase.swift
//  StockTutorial
//
//  Created by 이건준 on 2022/02/01.
//

import Foundation
import Combine

class StockUseCase {
    
    func fetchStocksPublisher(keyword: String) -> AnyPublisher<StockResult, Error>{
        return stockRepository.fetchStocksPublisher(keyword: keyword)
    }
    
    private let stockRepository: StockRepository
    
    init(stockRepository:StockRepository) {
        self.stockRepository = stockRepository
    }
}
