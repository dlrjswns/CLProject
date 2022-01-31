//
//  StockRepositoryImpl.swift
//  StockTutorial
//
//  Created by 이건준 on 2022/02/01.
//

import Foundation

class StockRepositoryImpl:StockRepository{
    var apiKey: String = "MDJ8Q1EZPTTCY67N"
    
    
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
