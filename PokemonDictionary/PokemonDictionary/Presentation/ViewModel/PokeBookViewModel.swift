//
//  PokeBookViewModel.swift
//  PokemonDictionary
//
//  Created by 이건준 on 2022/03/04.
//

import RxSwift
import RxCocoa

class PokeBookViewModel {
    private let usecase: PokeBookUsecase
    var disposeBag = DisposeBag()
    var initialPokeModel: [PokeBookModel]?
    
    //input
    let fetchInput: AnyObserver<Void>
    let fireFetchInput: AnyObserver<Void>
    
    //output
    let fetchOutput: Signal<Void>
    let pokeModelOutput: Driver<[PokeBookModel]>
    let pokeErrorOutput: Signal<PokeError?>
    let emptyOutput: Driver<Bool>
    
    init(usecase: PokeBookUsecase) {
        self.usecase = usecase
        
        let fetching = PublishSubject<Void>()
        let pokeModel = BehaviorRelay<[PokeBookModel]>(value: [])
        let pokeError = PublishSubject<PokeError?>()
        let isEmpty = BehaviorSubject<Bool>(value: true)
        let fireFetching = PublishSubject<Void>()
        
        fetchInput = fetching.asObserver()
        fetchOutput = fetching.asSignal(onErrorJustReturn: ())
        pokeModelOutput = pokeModel.asDriver(onErrorJustReturn: [])
        pokeErrorOutput = pokeError.asSignal(onErrorJustReturn: nil)
        emptyOutput = isEmpty.asDriver(onErrorJustReturn: true)
        fireFetchInput = fireFetching.asObserver()
        
        fetching
            .flatMap{usecase.fetchPokeEntityObservable()}
            .subscribe(onNext: { [weak self] result in
                switch result {
                   case .failure(let error):
                       pokeError.onNext(error)
                   case .success(let pokeEntity):
                       let pokeBookModels = usecase.fetchPokeModel(pokeEntities: pokeEntity)
                       pokeModel.accept(pokeBookModels)
                    self?.initialPokeModel = pokeBookModels
                    isEmpty.onNext(false)
                   }
            }).disposed(by: disposeBag)
        
//        fireFetching
//            .flatMap{pokeModel}
//            .map { pokeBookModels in
//                return pokeBookModels.forEach{$0}
//            }
            
            
            
            
            
            
        
//        usecase.fetchPokeEntityObservable()
//            .subscribe(onNext: { result in
//                switch result {
//                   case .failure(let error):
//                       pokeError.onNext(error)
//                   case .success(let pokeEntity):
//                       let pokeBookModels = usecase.fetchPokeModel(pokeEntities: pokeEntity)
//                       pokeModel.accept(pokeBookModels)
//                   }
//            }).disposed(by: disposeBag)
        
//        usecase.fetchPokeBookObservable().map { result in
//            switch result {
//            case .failure(let error):
//                pokeError.onNext(error)
//            case .success(let pokeEntity):
//                let pokeBookModels = usecase.fetchPokeModel(pokeEntities: pokeEntity)
//                pokeModel.accept(pokeBookModels)
//            }
//        }
        
    }
    
    
}
