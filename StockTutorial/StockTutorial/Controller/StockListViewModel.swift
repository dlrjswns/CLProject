//
//  StockListViewModel.swift
//  StockTutorial
//
//  Created by 이건준 on 2022/02/01.
//

import RxSwift
import Combine

class StockListViewModel: BaseViewModel {
    @Published var stocks:[Stock] = []
    @Published var errorMessage:String? //RxSwift든 Combine이든 error를 위한 subject나 published를 가지고 각각 내려보내는게 좋은듯, 보통 Result를 이용하니까
    @Published var loading:Bool = false
    @Published var isEmpty = false
//    var loading: BehaviorSubject<Bool> = .init(value: false)
//    var errorMessage:BehaviorSubject<String?> = .init(value: nil)
//    var stocks:BehaviorSubject<[Stock]> = .init(value: [])
    var currentStocks:[Stock] = []
    
//    var subscriber:Set<AnyCancellable> = .init()
    let usecase:StockUseCase
    
    func searchQueryChanged(query: String){
        loading = true
        usecase.fetchStocksPublisher(keyword: query).sink { [weak self] completion in //그리고 개인적으로 RxSwift에선 각각의 이벤트에 대한 처리를 switch로 해줘서 조금 난잡했는데 Combine에서는 값을 받는 부분과 나머지 처리과 나눠져있어 좀 더 보기편함
            self?.loading = false
            switch completion{
            case .failure(let error):
                self?.errorMessage = error.localizedDescription
            case .finished: break
            }
        } receiveValue: { [weak self] stockResult in
            self?.currentStocks = stockResult.items
            self?.stocks = stockResult.items
        }.store(in: &subscriber)

    }
    
    init(usecase:StockUseCase) {
        self.usecase = usecase
        super.init()
        reduce()
    }
    
    func reduce() {
        $stocks.sink { [weak self] stocks in
            if stocks.count == 0 {
                self?.isEmpty = true
            }else {
                self?.isEmpty = false
            }
        }.store(in: &subscriber)
    }
    
//    func viewDidLoad(){
//        usecase.fetchStocksPublisher(keyword: "AMZ").sink { completion in
//            self.loading.onNext(false)
//            switch completion{
//                case .failure(let error):
//                    self.errorMessage.onNext(error.localizedDescription)
//                case .finished: break
//            }
//        } receiveValue: { stockResult in
//            self.loading.onNext(true)
//            self.stocks.onNext(stockResult.items)
//        }.store(in: &subscriber)
//
//    }
}
