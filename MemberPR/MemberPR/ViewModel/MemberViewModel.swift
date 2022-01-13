//
//  MemberViewModel.swift
//  MemberPR
//
//  Created by 이건준 on 2022/01/14.
//

import Foundation
import RxSwift
import RxRelay

class MemberViewModel{
    let memberService = MemberService()
    var memberRelay = BehaviorRelay<[MemberModel]>(value: [])
    
    //Model -> ViewModel
//    func fetchImage(_ item:MemberModel){
//        let imageName = item.avatar
//        
//    }
    
    init(){
        memberService.fetchMemberModel { [weak self] memberModels in
//            guard let memberModels = memberModels else {return}
            self?.memberRelay.accept(memberModels)
        }
    }
}
