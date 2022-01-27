//
//  File.swift
//  MemberPR
//
//  Created by 이건준 on 2022/01/27.
//

import Foundation
import RxSwift

protocol MemberRepository {
    func getMember() -> Observable<Result<[Member], MemberError>>
}

enum MemberError:Error{
    case urlNotFound
    case decodeError
    case defaultError(String)
    
    var message:String{
        switch self{
        case .urlNotFound:
            return "URL이 옳지않습니다"
        case .decodeError:
            return "Decode실패하였습니다"
        case .defaultError(let message):
            return message
        }
    }
}
