
import UIKit
import RxSwift
import RxCocoa

class RootViewModel {
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
    
    func createSignal() -> Signal<String> {
        
    }
}
