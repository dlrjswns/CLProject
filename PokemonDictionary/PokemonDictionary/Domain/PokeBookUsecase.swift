//
//  PokeBookUsecase.swift
//  PokemonDictionary
//
//  Created by 이건준 on 2022/03/04.
//

import RxSwift

class PokeBookUsecase {
    
    private let repository: PokeBookRepository
    
    init(repository: PokeBookRepository) {
        self.repository = repository
    }
    
    func fetchPokeBookObservable() -> Observable<Result<PokeEntity, PokeError>> {
        return repository.fetchPokeBookObservable()
    }
}
