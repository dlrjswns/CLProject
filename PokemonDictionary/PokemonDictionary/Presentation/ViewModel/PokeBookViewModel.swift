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
    
    //input
    let fetchInput: AnyObserver<Void>
    
    //output
    let fetchOutput: Signal<Void>
    let pokeModelOutput: Driver<[PokeBookModel]>
    let pokeErrorOutput: Signal<PokeError?>
    
    init(usecase: PokeBookUsecase) {
        self.usecase = usecase
        
        let fetching = PublishSubject<Void>()
        let pokeModel = PublishRelay<[PokeBookModel]>()
        let pokeError = PublishSubject<PokeError?>()
        
        fetchInput = fetching.asObserver()
        fetchOutput = fetching.asSignal(onErrorJustReturn: ())
        pokeModelOutput = pokeModel.asDriver(onErrorJustReturn: [])
        pokeErrorOutput = pokeError.asSignal(onErrorJustReturn: nil)
        
        fetching
            .flatMap{usecase.fetchPokeEntityObservable()}
            .subscribe(onNext: { result in
                switch result {
                   case .failure(let error):
                       pokeError.onNext(error)
                   case .success(let pokeEntity):
                       let pokeBookModels = usecase.fetchPokeModel(pokeEntities: pokeEntity)
                       pokeModel.accept(pokeBookModels)
                   }
            }).disposed(by: disposeBag)
        
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
