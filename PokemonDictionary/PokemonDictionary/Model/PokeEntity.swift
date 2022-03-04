//
//  PokeBookEntity.swift
//  PokemonDictionary
//
//  Created by 이건준 on 2022/03/04.
//

import Foundation

struct PokeEntity: Decodable {
    let attack: Int?
    let defense: Int?
    let description: String?
    let evolutionChain: [Evolution]?
    let height: Int?
    let id: Int?
    let imageUrl: String?
    let name: String?
    let type: String?
    let weight: Int?
    
    enum CodingKeys: String, CodingKey {
        case attack, defense, description, evolutionChain, height, id, imageUrl, name, type, weight
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        self.attack = try? values.decode(Int.self, forKey: .attack)
        self.defense = try? values.decode(Int.self, forKey: .defense)
        self.description = try? values.decode(String.self, forKey: .description)
        self.evolutionChain = try? values.decode([Evolution].self, forKey: .evolutionChain)
        self.height = try? values.decode(Int.self, forKey: .height)
        self.id = try? values.decode(Int.self, forKey: .id)
        self.imageUrl = try? values.decode(String.self, forKey: .imageUrl)
        self.name = try? values.decode(String.self, forKey: .name)
        self.type = try? values.decode(String.self, forKey: .type)
        self.weight = try? values.decode(Int.self, forKey: .weight)
    }
}

struct Evolution: Decodable {
    let id: String
    let name: String
}
