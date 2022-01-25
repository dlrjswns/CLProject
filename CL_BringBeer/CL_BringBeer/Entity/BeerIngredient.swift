//
//  BeerIngredient.swift
//  CL_BringBeer
//
//  Created by 이건준 on 2022/01/22.
//

import Foundation

struct BeerIngredient:Codable{
    let malt:[BeerMalt]
    let hops:[BeerHop]
    let yeast:String
}

struct BeerMalt:Codable{
    let name:String
    let amount:BeerAmount
}

struct BeerAmount:Codable{
    let value:Double
    let unit:String
}

struct BeerHop:Codable{
    let name:String
    let amount:BeerAmount
    let add:String
    let attribute:String
}



