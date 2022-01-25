//
//  BeerMethod.swift
//  CL_BringBeer
//
//  Created by 이건준 on 2022/01/21.
//

import Foundation

struct BeerMethod:Codable{
    let mashTemp:[MashTemp]
    let fermentation:Fermentation
    let twist:String?
    
    enum Codingkeys:String, CodingKey{
        case mashTemp = "mash_temp"
        case fermentation, twist
    }
}

struct MashTemp:Codable{
    let temp:Temp
    let duration:Int
}

struct Temp:Codable{
    let value:Int
    let unit:String
}

struct Fermentation:Codable{
    let temp:Temp
}


