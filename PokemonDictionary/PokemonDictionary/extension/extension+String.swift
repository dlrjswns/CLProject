//
//  extension+String.swift
//  PokemonDictionary
//
//  Created by 이건준 on 2022/03/05.
//

import Foundation

extension String {
    func fetchFirstUpperCased() -> String {
        guard let first = self.first?.uppercased() else { return "" }
        let drop = self.dropFirst()
        return first + drop
    }
}
