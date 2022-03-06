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
//            let pokeBookModel = PokeBookModel(imageUrl: pokeEntity.imageUrl ?? "", name: pokeEntity.name ?? "", type: fetchPokeType(pokeEntityType: pokeEntity.type ?? ""))
            let pokeBookModel = PokeBookModel(imageUrl: pokeEntity.imageUrl ?? "", name: pokeEntity.name ?? "", type: fetchPokeType(pokeEntityType: pokeEntity.type ?? ""), attack: pokeEntity.attack ?? 0, defense: pokeEntity.defense ?? 0, description: pokeEntity.description ?? "", evolutionChain: pokeEntity.evolutionChain ?? [], height: pokeEntity.height ?? 0, weight: pokeEntity.weight ?? 0, id: pokeEntity.id ?? 0)
            pokeBookModels.append(pokeBookModel)
        }
        return pokeBookModels
    }
    
    func fetchPokeType(pokeEntityType: String) -> PokeType {
        switch pokeEntityType {
            case "poison":
                return .poison
            case "fire":
                return .fire
            case "water":
                return .water
            case "bug":
                return .bug
            case "flying":
                return .flying
            case "normal":
                return .normal
            case "electric":
                return .electric
            case "ground":
                return .ground
            case "grass":
                return .grass
            case "fighting":
                return .fighting
            case "psychic":
                return .psychic
            case "ice":
                return .ice
            case "dragon":
                return .dragon
            case "rock":
                return .rock
            case "fairy":
                return .fairy
            case "steel":
                return .steel
            default:
                return .normal
        }
    }
}


