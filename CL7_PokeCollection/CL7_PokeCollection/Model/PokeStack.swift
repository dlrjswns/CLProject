//
//  PokeStack.swift
//  CL7_PokeCollection
//
//  Created by 이건준 on 2021/12/25.
//

import UIKit

struct PokeStack:Decodable{
    let name:String?
    let imageUrl:String?
    let description:String?
    let height:Int?
    let weight:Int?
    let attack:Int?
    let type:String?
    let evolutionChain:[EvolutionChain]?
}
struct EvolutionChain:Decodable{
    let id:String
    let name:String
}
