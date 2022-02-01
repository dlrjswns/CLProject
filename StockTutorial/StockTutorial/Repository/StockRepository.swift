//
//  StockRepository.swift
//  StockTutorial
//
//  Created by 이건준 on 2022/02/01.
//

import Combine

protocol StockRepository {
    func fetchStocksPublisher(keyword: String) -> AnyPublisher<StockResult, Error>
    func fetchStocksOriginal(keyword: String) -> Result<StockResult, StockError>
}

enum StockError: Error{
    case urlNotFound
}
