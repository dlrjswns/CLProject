//
//  MemberService.swift
//  MemberPR
//
//  Created by 이건준 on 2022/01/27.
//

import RxSwift

protocol MemberService {
    func getMemberModel() -> Observable<Result<[MemberModel], MemberError>>
}
