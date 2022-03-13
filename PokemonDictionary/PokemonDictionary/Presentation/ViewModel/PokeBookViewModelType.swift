//
//  PokeBookViewModelType.swift
//  PokemonDictionary
//
//  Created by 이건준 on 2022/03/13.
//

import RxSwift
import RxCocoa

protocol PokeBookViewModelType {
    //input
    var fetchInput: AnyObserver<Void> { get }
    var fireFetchInput: AnyObserver<Void> { get }
    var waterFetchInput: AnyObserver<Void> { get }
    var poisonFetchInput: AnyObserver<Void> { get }
    var electricFetchInput: AnyObserver<Void> { get }
    var allFetchInput: AnyObserver<Void> { get }
    
    //output
    var fetchOutput: Signal<Void> { get }
    var pokeModelOutput: Driver<[PokeBookModel]> { get }
    var pokeErrorOutput: Signal<PokeError?> { get }
    var emptyOutput: Driver<Bool> { get }
}
