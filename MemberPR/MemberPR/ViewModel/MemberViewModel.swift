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
    let memberService:MemberService
    let disposeBag = DisposeBag()
    var memberRelay = BehaviorRelay<[MemberModel]>(value: [])
    
    
    init(memberService:MemberService){
        self.memberService = memberService
        
        memberService.getMemberModel()
            .subscribe(onNext:{ result in
                switch result{
                case .success(let memberModels):
                    print("memberModels = \(memberModels)")
                    self.memberRelay.accept(memberModels)
                case .failure(let memberError):
                    print("MemberViewModel ErrorMessage - \(memberError.message)")
                }
            })
            .disposed(by: disposeBag)
    
    
    //Model -> ViewModel
//    func fetchImage(_ item:MemberModel){
//        let imageName = item.avatar
//        
//    }
    
//    init(){
//        memberService.fetchMemberModel { [weak self] memberModels in
////            guard let memberModels = memberModels else {return}
//            self?.memberRelay.accept(memberModels)
//        }
//    }
}
}
