//
//  PokeType.swift
//  PokemonDictionary
//
//  Created by 이건준 on 2022/03/05.
//

import Foundation

enum PokeType {
    case poison
    case fire
    case water
    case bug
    case flying
    case normal
    case electric
    case ground
    case grass
    case fighting
    case psychic
    case ice
    case dragon
    case rock
    case fairy
    case steel
    
    var toString: String {
        switch self {
        case .poison:
            return "poison"
        case .fire:
            return "fire"
        case .water:
            return "water"
        case .bug:
            return "bug"
        case .flying:
            return "flying"
        case .normal:
            return "normal"
        case .electric:
            return "electric"
        case .ground:
            return "ground"
        case .grass:
            return "grass"
        case .fighting:
            return "fighting"
        case .psychic:
            return "psychic"
        case .ice:
            return "ice"
        case .dragon:
            return "dragon"
        case .rock:
            return "rock"
        case .fairy:
            return "fairy"
        case .steel:
            return "steel"
        }
    }
}
