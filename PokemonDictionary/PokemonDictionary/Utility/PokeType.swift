//
//  PokeType.swift
//  PokemonDictionary
//
//  Created by 이건준 on 2022/03/05.
//

import UIKit

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
    
    var getPokeColor: UIColor {
        switch self {
            case .bug:
                return .systemGreen
            case .dragon:
                return .systemTeal
            case .electric:
                return .systemYellow
            case .fighting:
                return .purple
            case .fire:
                return .systemRed
            case .flying:
                return .blue
            case .grass:
                return .systemPurple
            case .ground:
                return .brown
            case .ice:
                return .systemBlue
            case .normal:
                return .systemOrange
            case .poison:
                return .systemGreen
            case .psychic:
                return .systemGray3
            case .water:
                return .systemBlue
            case .rock:
                return .systemPurple
            case .fairy:
                return .systemPink
            case .steel:
                return .systemGray6
                }
            }
    
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
    } //toString end
}

