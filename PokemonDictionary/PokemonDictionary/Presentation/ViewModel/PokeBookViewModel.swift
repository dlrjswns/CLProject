//
//  PokeBookViewModel.swift
//  PokemonDictionary
//
//  Created by 이건준 on 2022/03/04.
//

import RxSwift
import RxCocoa

class PokeBookViewModel: PokeBookViewModelType {
    private let usecase: PokeBookUsecase
    var disposeBag = DisposeBag()
    var initialPokeModel: [PokeBookModel] = []
    
    //input
    let fetchInput: AnyObserver<Void>
    let fireFetchInput: AnyObserver<Void>
    let waterFetchInput: AnyObserver<Void>
    let poisonFetchInput: AnyObserver<Void>
    let electricFetchInput: AnyObserver<Void>
    let allFetchInput: AnyObserver<Void>
    
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
        let waterFetching = PublishSubject<Void>()
        let poisonFetching = PublishSubject<Void>()
        let electricFetching = PublishSubject<Void>()
        let allFetching = PublishSubject<Void>()
        let initPokemon = BehaviorSubject<[PokeBookModel]>(value: [])
        
        fetchInput = fetching.asObserver()
        fetchOutput = fetching.asSignal(onErrorJustReturn: ())
        pokeModelOutput = pokeModel.asDriver(onErrorJustReturn: [])
        pokeErrorOutput = pokeError.asSignal(onErrorJustReturn: nil)
        emptyOutput = isEmpty.asDriver(onErrorJustReturn: true)
        fireFetchInput = fireFetching.asObserver()
        waterFetchInput = waterFetching.asObserver()
        poisonFetchInput = poisonFetching.asObserver()
        electricFetchInput = electricFetching.asObserver()
        allFetchInput = allFetching.asObserver()
        
        //초기데이터뿌리기
        fetching
            .flatMap{usecase.fetchPokeEntityObservable()}
            .take(1)
            .subscribe(onNext: { result in
                switch result {
                   case .failure(let error):
                       pokeError.onNext(error)
                   case .success(let pokeEntity):
                       let pokeBookModels = usecase.fetchPokeModel(pokeEntities: pokeEntity)
                       pokeModel.accept(pokeBookModels)
                       initPokemon.onNext(pokeBookModels)
                       isEmpty.onNext(false)
                   }
            }).disposed(by: disposeBag)
        
        //PokeUtilButton에 따른 액션(포켓몬 타입 패칭)
        //poison네임선택을 초기엔 이미지에 맞게 grass로 하였으나 grass타입의 대표포켓몬인 이상해씨가 API에서 poison타입으로 되어있어 네임은 poison으로 택
        Observable.merge(
            fireFetching
                .flatMap {initPokemon.asObservable()}
                .map{$0.filter{$0.type == .fire}},
            waterFetching
                .flatMap {initPokemon.asObservable()}
                .map{$0.filter{$0.type == .water}},
            poisonFetching
                .flatMap {initPokemon.asObservable()}
                .map{$0.filter{$0.type == .poison}},
            electricFetching
                .flatMap {initPokemon.asObservable()}
                .map{$0.filter{$0.type == .electric}},
            allFetching
                .flatMap {initPokemon.asObservable()}
        )
        .bind(to: pokeModel)
        .disposed(by: disposeBag)
        
    }
}
