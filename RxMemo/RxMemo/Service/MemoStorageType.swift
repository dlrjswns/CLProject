//
//  MemoStorageType.swift
//  RxMemo
//
//  Created by 이건준 on 2022/01/25.
//

import Foundation
import RxSwift

protocol MemoStorageType {
    @discardableResult //이처럼 Observable로 리턴하면 구독자가 작업자를 원하는 방식으로 처리할 수 있게된다, 반대로 작업결과가 필요없는 경우가 있기때문에 이 특성을 사용해준다
    func createMemo(content:String)->Observable<Memo>
    
    @discardableResult
    func memoList()->Observable<[Memo]>
    
    @discardableResult
    func update(memo:Memo, content:String)->Observable<Memo>
    
    @discardableResult
    func delete(memo:Memo)->Observable<Memo>
}
