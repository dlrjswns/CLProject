//
//  StockDetailUseCase.swift
//  StockTutorial
//
//  Created by 이건준 on 2022/02/08.
//

import Combine
import Foundation

class StockDetailUseCase {
    
    func fetchTimeSeriesPublisher(keyword: String) -> AnyPublisher<TimeSeriesMonthlyAdjusted, Error> {
        return stockRepository.fetchTimeSeriesPublisher(keyword: keyword)
    }
    
    func fetchMonthInfo(value: TimeSeriesMonthlyAdjusted) -> [MonthInfo] {
        var monthInfos: [MonthInfo] = []
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let sortedSeries = value.series.sorted { $0.key > $1.key }
        sortedSeries.forEach { dateString, ohlc in
            if let date = dateFormatter.date(from: dateString), let adjustedClose = ohlc.adjustedClose,let adjustedOpen = generateAdjustedOpen(ohlc: ohlc) {
                let monthInfo: MonthInfo = .init(date: date, adjustedOpen: adjustedOpen, adjustedClose: adjustedClose)
                monthInfos.append(monthInfo)
            }
        }
        
        return monthInfos
    }
    
    private func generateAdjustedOpen(ohlc: OHLC) -> Double? {
        var adjustedOpen: Double?
        if let open = ohlc.open, let close = ohlc.close, let adjustedClose = ohlc.adjustedClose {
            adjustedOpen = open * (adjustedClose / close)
        }
        return adjustedOpen
    }
    
    private let stockRepository: StockRepository
    
    init(stockRepository: StockRepository) {
        self.stockRepository = stockRepository
    }
}
