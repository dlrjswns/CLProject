//
//  StockDetailViewModel.swift
//  StockTutorial
//
//  Created by 이건준 on 2022/02/08.
//

import Combine

class StockDetailViewModel: BaseViewModel {
    @Published var loading = false
    @Published var errorMessage: String?
    @Published var monthInfo: [MonthInfo]?
    @Published var stock: Stock?
    
    let usecase: StockDetailUseCase
    
    func configureUI(stockDetailView: StockDetailView?, stock: Stock) {
        usecase.configureUI(stockDetailView: stockDetailView, stock: stock)
    }
    
    func viewDidLoad(symbol: String, stock: Stock) {
        self.stock = stock
        loading = true
        usecase.fetchTimeSeriesPublisher(keyword: symbol).sink { completion in
            self.loading = false
            switch completion {
            case .failure(let error):
                self.errorMessage = error.localizedDescription
            case .finished: break
            }
        } receiveValue: { [weak self] value in
            self?.monthInfo = self?.usecase.fetchMonthInfo(value: value)
        }.store(in: &subscriber)

    }
    
    init(usecase: StockDetailUseCase) {
        self.usecase = usecase
        super.init()
    }
}
