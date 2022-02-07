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
//        guard let keyword = keyword.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else {
//            let error = StockError.error("Encoding Error")
//            return Fail(error: error).eraseToAnyPublisher()
//        }
        
        var query = ""
        let queryResult = parseQueryString(text: keyword)
        switch queryResult {
        case .failure(let error):
            return Fail(error: error).eraseToAnyPublisher()
        case .success(let value):
            query = value
        }
//        guard let url = getSearchCompanyOrSymbolURLComponents(keywords: query).url else {
////            let error = URLError(.badURL) 이 error를 아래 Fail인자로 넘겨줘도됨 ㅇㅇ
//            let error = StockError.urlNotFound
//            return Fail(error: error).eraseToAnyPublisher()
//        }
        
        let urlResult = parseURL(urlComponents: getSearchCompanyOrSymbolURLComponents(keywords: query))
        switch urlResult {
        case .failure(let error):
            return Fail(error: error).eraseToAnyPublisher()
        case .success(let url):
            return session.dataTaskPublisher(for: URLRequest(url: url))
                        .mapError { _ in
                            StockError.error("getStockAPI 에러")
                        }
                        .receive(on: DispatchQueue.main) //이 코드가 없으면 에러남, ㅇㅅ ㅇ
                        .flatMap { [weak self] data in
                            return Just(data.data)
                                .decode(type: StockResult.self, decoder: self?.decoder ?? JSONDecoder())
                                .mapError { _ in
                                    StockError.decodeFail
                                }
                        }
                        .eraseToAnyPublisher()
        }
    }
    
    func fetchTimeSeriesPublisher(keyword: String) -> AnyPublisher<TimeSeriesMonthlyAdjusted, Error> {
        
        var query = ""
        let queryResult = parseQueryString(text: keyword)
        switch queryResult {
        case .failure(let error):
            return Fail(error: error).eraseToAnyPublisher()
        case .success(let value):
            query = value
        }
        
        let urlResult = parseURL(urlComponents: getTimeSeriesURLComponents(keyword: query))
        switch urlResult {
        case .failure(let error):
            return Fail(error: error).eraseToAnyPublisher()
        case .success(let url):
            return session.dataTaskPublisher(for: url)
                        .mapError { _ in
                        StockError.error("TimeSeries API Error")
                        }
                        .receive(on: DispatchQueue.main)
                        .flatMap { [weak self] data in
                            return Just(data.data)
                                .decode(type: TimeSeriesMonthlyAdjusted.self, decoder: self?.decoder ?? JSONDecoder())
                                .mapError { _ in
                                    StockError.decodeFail
                                }
                        }
                        .eraseToAnyPublisher()
            }
       
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
    
    private func parseURL(urlComponents: URLComponents) -> Result<URL, Error> {
        if let url = urlComponents.url {
            return .success(url)
        }else {
            let error = StockError.urlNotFound
            return .failure(error)
        }
    }
    
    private func parseQueryString(text: String) -> Result<String, Error> { //만약에 검색을 할때 띄어쓰기를 하여 검색할 경우에 띄어쓰기는 URL에 옳지않은 형식이기에 오류메세지를 일으킨다, 이를 해결해주기위해서 이 코드를 작성한다
        if let query = text.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) {
            return .success(query)
        }else {
            let error = StockError.error("Encoding Error")
            return .failure(error)
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

extension StockRepositoryImpl {
    struct StockAPI {
        static let scheme = "https"
        static let host = "www.alphavantage.co"
        static let path = "/query"
    }
    
    func getSearchCompanyOrSymbolURLComponents(keywords:String) -> URLComponents {
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
    
    func getTimeSeriesURLComponents(keyword: String) -> URLComponents {
        var components = URLComponents()
        components.scheme = StockAPI.scheme
        components.host = StockAPI.host
        components.path = StockAPI.path
        
        components.queryItems = [
            URLQueryItem(name: "function", value: "TIME_SERIES_MONTHLY_ADJUSTED"),
            URLQueryItem(name: "symbol", value: keyword),
            URLQueryItem(name: "apikey", value: apiKey)
        ]
        return components
    }
}
