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
    
    func fetchPokeEntityObservable() -> Observable<Result<[PokeEntity], PokeError>> {
        return repository.fetchPokeEntityObservable()
    }
    
    func fetchPokeModel(pokeEntities: [PokeEntity]) -> [PokeBookModel] {
        var pokeBookModels = [PokeBookModel]()
        pokeEntities.forEach { pokeEntity in
            let pokeBookModel = PokeBookModel(imageUrl: pokeEntity.imageUrl ?? "", name: pokeEntity.name ?? "", type: pokeEntity.type ?? "")
            pokeBookModels.append(pokeBookModel)
        }
        return pokeBookModels
    }
}
