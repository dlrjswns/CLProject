//
//  BeerNetworking.swift
//  CL_BringBeer
//
//  Created by 이건준 on 2022/01/20.
//

import Foundation
import RxSwift

enum BeerError:Error{
    case customError(String)
    
    var errorMessage:String{
        switch self{
        case .customError(let errMsg):
            return errMsg
        }
    }
}

protocol BeerRepository{
    func getBeers(url:String)->Observable<Result<[Beer], BeerError>>
}
