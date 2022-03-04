//
//  PokeBookRepository.swift
//  PokemonDictionary
//
//  Created by 이건준 on 2022/03/04.
//

import RxSwift
import Foundation

protocol PokeBookRepository {
    func fetchPokeBookObservable() -> Observable<Result<PokeEntity, PokeError>>
}

enum PokeError: Error {
    case urlError
    case decodeError
    case defaultError(String)
    
    
}
