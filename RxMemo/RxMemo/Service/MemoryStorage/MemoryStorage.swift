//
//  MemoryStorage.swift
//  RxMemo
//
//  Created by 이건준 on 2022/01/25.
//

import Foundation
import RxSwift

class MemoryStorage:MemoStorageType{
    private var list = [
        Memo(content: "Hello, Gunjun", insertDate: Date().addingTimeInterval(-30)),
        Memo(content: "Hello, Jisoo", insertDate: Date().addingTimeInterval(-10))
    ]
    
    private lazy var store = BehaviorSubject<[Memo]>(value: list)
    
    @discardableResult
    func createMemo(content: String) -> Observable<Memo> {
        let newMemo = Memo(content: content)
        list.insert(newMemo, at: 0)
        
        store.onNext(list)
        
        return Observable.just(newMemo)
    }
    
    @discardableResult
    func memoList() -> Observable<[Memo]> {
        return store
    }
    
    @discardableResult
    func update(memo: Memo, content: String) -> Observable<Memo> {
        let updated = Memo(original: memo, updatedContent: content)
        
        if let index = list.firstIndex(where: {$0 == memo}){
            list.remove(at: index)
            list.insert(updated, at: index)
        }
        
        store.onNext(list)
        
        return Observable.just(updated)
    }
    
    @discardableResult
    func delete(memo: Memo) -> Observable<Memo> {
        if let index = list.firstIndex(where: {$0 == memo}){
            list.remove(at: index)
        }
        
        store.onNext(list)
        
        return Observable.just(memo)
    }
    
    
}
