//
//  StockRepositoryImpl.swift
//  StockTutorial
//
//  Created by 이건준 on 2022/02/01.
//

import Foundation
import Combine
import RxSwift
import RxCocoa

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
    
    func fetchStocksRxSwift(keyword: String) -> Observable<Result<StockResult, StockError>>{
        guard let url = getSearchCompanyOrSymbolURLComponents(keywords: keyword).url else {return .just(.failure(StockError.urlNotFound))}
        return session.rx.data(request: URLRequest(url: url)).map { data in
            do{
                let stockResult = try self.decoder.decode(StockResult.self, from: data)
                return .success(stockResult)
            }catch{
                return .failure(StockError.decodeFail)
            }
        }
    }
    
//    func fetchStocksOriginal(keyword: String) -> Result<StockResult, StockError>{
//        guard let url = getSearchCompanyOrSymbolURLComponents(keywords: keyword).url else {return .failure(StockError.urlNotFound)}
//        
//        session.dataTask(with: URLRequest(url: url)) { data, response, error in
//            guard let data = data else {return}
//            do{
//                let stockResult = try self.decoder.decode(StockResult.self, from: data)
//                retur
//            }catch{
//                
//            }
//        }
//    }
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
