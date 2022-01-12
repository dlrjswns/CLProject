//
//  OrderList.swift
//  OrderList
//
//  Created by 이건준 on 2022/01/09.
//

import Foundation

//Entity
struct Menus:Codable{
    let menus:[Menu]?
}

struct Menu:Codable{
    let name:String?
    let price:Int?
}
