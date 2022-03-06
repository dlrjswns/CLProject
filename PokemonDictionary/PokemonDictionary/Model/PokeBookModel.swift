//
//  PokeBookModel.swift
//  PokemonDictionary
//
//  Created by 이건준 on 2022/03/04.
//

import Foundation

struct PokeBookModel {
    let imageUrl: String
    let name: String
    let type: PokeType
    let attack: Int
    let defense: Int
    let description: String
    let evolutionChain: [Evolution]
    let height: Int
    let weight: Int
    let id: Int
}
