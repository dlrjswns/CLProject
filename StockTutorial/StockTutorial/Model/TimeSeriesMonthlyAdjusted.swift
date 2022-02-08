//
//  TimeSeriesMonthlyAdjusted.swift
//  StockTutorial
//
//  Created by 이건준 on 2022/02/08.
//

import Foundation

struct TimeSeriesMonthlyAdjusted: Decodable {
    let meta: Meta
    let series: [String: OHLC]
    
    enum CodingKeys: String, CodingKey {
        case meta = "Meta Data"
        case series = "Monthly Adjusted Time Series"
    }
//    func generateMonthInfos() -> [MonthInfo] {
//        var monthInfos: [MonthInfo] = []
//
//        let sortedSeries = series.sorted { $0.key > $1.key }
//
//        sortedSeries.forEach { dateString, ohlc in
//            let monthInfo: MonthInfo = .init(date: <#T##Date#>, adjustedOpen: <#T##Double#>, adjustedClose: <#T##Double#>)
//        }
//
//        return monthInfos
//    }
}

struct OHLC: Decodable {
    let open: Double?
    let close: Double?
    let adjustedClose: Double?
    
    enum CodingKeys: String, CodingKey {
        case open = "1. open"
        case close = "4. close"
        case adjustedClose = "5. adjusted close"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        let open = try? values.decode(String.self, forKey: .open)
        let close = try? values.decode(String.self, forKey: .close)
        let adjustedClose = try? values.decode(String.self, forKey: .adjustedClose)
        
        self.open = Double(open ?? "")
        self.close = Double(close ?? "")
        self.adjustedClose = Double(adjustedClose ?? "")
    }
}

struct Meta: Decodable {
    let symbol: String
    
    enum CodingKeys: String, CodingKey {
        case symbol = "2. Symbol"
    }
}
