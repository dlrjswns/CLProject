
import UIKit
import RxSwift
import RxCocoa

class RootViewModel {
    
    let prObserver: AnyObserver<String>
    let prObservable: Observable<String>
    var disposeBag = DisposeBag()
    
    init() {
        let prSubject = BehaviorSubject<String>(value: "")
        prObserver = prSubject.asObserver()
        prObservable = prSubject.asObservable()
        
        prObservable.subscribe(onNext: { prStr in
            print("prStr = \(prStr)")
        }).disposed(by: disposeBag)
        
        
    }
    
    
    func createSingle() -> Single<String> {
        return Single.create() { emitter -> Disposable in
            let str = "Single Practice"
            emitter(.success(str))
            
            let error = URLError(.badURL)
            emitter(.failure(error))
            return Disposables.create()
        }
    }
    
    func createObservable() -> Observable<String> {
        return Observable.create() { emitter in
            emitter.onNext("Observable Practice")
            return Disposables.create()
        }
    }
    
    
}
