//
//  RootViewModel.swift
//  MemberPR
//
//  Created by 이건준 on 2022/01/11.
//

import UIKit
import RxSwift

struct Food{
    var name:String
    var price:Int
    var count:Int
}

class RootViewModel{
    var rootViewObservable:BehaviorSubject<[Food]> = BehaviorSubject(value: [])
    lazy var totalCount = rootViewObservable.map { foods in
        foods.map { food in
            food.count
        }.reduce(0, +)
    }
    
    init() {
        let foods : [Food] = [
            Food(name: "초콜릿", price: 1000, count: 0)
        ]
        
        rootViewObservable.onNext(foods)
    }
    
    func changeCount(_ changeCount:Int){
        rootViewObservable.onNext([Food(name: "초콜릿", price: 1000, count: 0+changeCount)])
    }
}
