//
//  LoginViewModel.swift
//  LoginValidation
//
//  Created by 이건준 on 2022/01/31.
//

import RxSwift
import RxCocoa

class LoginViewModel{
    //MARK: -Property
    let idPublishSubject = PublishSubject<String>()
    let pwPublishSubject = PublishSubject<String>()
    let ob = Observable.from(["sdf", "sfs", "afa"])
    
    //MARK: -Helper
    func isValid() -> Observable<Bool>{ //isValid함수에서는 위 id와 pw을 담당하는 2개를 전부 관찰해야하기때문에 combineLatest를 사용
        Observable.combineLatest(idPublishSubject.asObservable(), pwPublishSubject.asObservable())
            .map { id, pw in
                return id.count > 3 && pw.count > 3
            }
    }
}
