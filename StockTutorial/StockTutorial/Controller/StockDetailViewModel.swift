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
    
    let usecase: StockDetailUseCase
    
    func viewDidLoad(symbol: String) {
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
