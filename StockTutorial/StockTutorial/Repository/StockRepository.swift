//
//  StockRepository.swift
//  StockTutorial
//
//  Created by 이건준 on 2022/02/01.
//

import Combine
import RxSwift

protocol StockRepository {
    func fetchStocksPublisher(keyword: String) -> AnyPublisher<StockResult, Error>
    func fetchStocksRxSwift(keyword: String) -> Observable<Result<StockResult, StockError>>
//    func fetchStocksOriginal(keyword: String) -> Result<StockResult, StockError>
}

enum StockError: Error{
    case error(String)
    case urlNotFound
    case decodeFail
    
    var message: String{
        switch self{
        case .error(let errMsg):
            return "errMsg = \(errMsg)"
        case .urlNotFound:
            return "errMsg = urlNotFound"
        case .decodeFail:
            return "errMsg = decodeFail"
        }
    }
}
