//
//  Stock.swift
//  StockTutorial
//
//  Created by 이건준 on 2022/02/01.
//

import Foundation

struct StockResult:Decodable {
    var items:[Stock]
    
    enum CodingKeys:String, CodingKey{
        case items = "bestMatches"
    }
}

struct Stock:Decodable {
    var symbol:String?
    var name:String?
    var type:String?
    var region:String?
    var marketOpen:String?
    var marketClose:String?
    var timezone:String?
    var currency:String?
    var matchScore:String?
    
    enum CodingKeys:String, CodingKey{
        case symbol = "1. symbol"
        case name = "2. name"
        case type = "3. type"
        case region = "4. region"
        case marketOpen = "5. marketOpen"
        case marketClose = "6. marketClose"
        case timezone = "7. timezone"
        case currency = "8. currency"
        case matchScore = "9. matchScore"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        self.symbol = try? values.decode(String.self, forKey: .symbol)
        self.name = try? values.decode(String.self, forKey: .name)
        self.type = try? values.decode(String.self, forKey: .type)
        self.region = try? values.decode(String.self, forKey: .region)
        self.marketOpen = try? values.decode(String.self, forKey: .marketOpen)
        self.marketClose = try? values.decode(String.self, forKey: .marketClose)
        self.timezone = try? values.decode(String.self, forKey: .timezone)
        self.currency = try? values.decode(String.self, forKey: .currency)
        self.matchScore = try? values.decode(String.self, forKey: .matchScore)
    }
}





//"bestMatches": [
//        {
//            "1. symbol": "TSCO.LON",
//            "2. name": "Tesco PLC",
//            "3. type": "Equity",
//            "4. region": "United Kingdom",
//            "5. marketOpen": "08:00",
//            "6. marketClose": "16:30",
//            "7. timezone": "UTC+00",
//            "8. currency": "GBX",
//            "9. matchScore": "0.7273"
//        },
