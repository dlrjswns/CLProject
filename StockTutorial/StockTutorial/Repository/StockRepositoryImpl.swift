//
//  StockRepositoryImpl.swift
//  StockTutorial
//
//  Created by 이건준 on 2022/02/01.
//

import Foundation
import Combine

class StockRepositoryImpl:StockRepository{
    private let session: URLSession
    let apiKey: String = "MDJ8Q1EZPTTCY67N"
    let decoder = JSONDecoder()
    
    init(session: URLSession = .shared) {
        self.session = session
    }
    
    func fetchStocksPublisher(keyword: String) -> AnyPublisher<StockResult, Error> {
        let url = getSearchCompanyOrSymbolURLComponents(keywords: keyword).url! //원래는 guard let으로 걸러내야하는데 Combine사용법을 잘 모름
        return session.dataTaskPublisher(for: url).map{$0.data}.decode(type: StockResult.self, decoder: decoder).receive(on: RunLoop.main).eraseToAnyPublisher()
    }
    
    func fetchStocksOriginal(keyword: String) -> Result<StockResult, StockError>{
        guard let url = getSearchCompanyOrSymbolURLComponents(keywords: keyword).url else {return .failure(StockError.urlNotFound)}
        
        session.dataTask(with: url) { data, response, error in
            
        }
}

extension StockRepositoryImpl{
    struct StockAPI {
        static let scheme = "https?function=SYMBOL_SEARCH&keywords=tesco&apikey=demo"
        static let host = "www.alphavantage.co"
        static let path = "/query"
    }
    
    func getSearchCompanyOrSymbolURLComponents(keywords:String) -> URLComponents{
        var components = URLComponents()
        components.scheme = StockAPI.scheme
        components.host = StockAPI.host
        components.path = StockAPI.path
        
        components.queryItems = [
            URLQueryItem(name: "function", value: "SYMBOL_SEARCH"),
            URLQueryItem(name: "keywords", value: keywords),
            URLQueryItem(name: "apikey", value: apiKey)
        ]
        return components
    }
}
