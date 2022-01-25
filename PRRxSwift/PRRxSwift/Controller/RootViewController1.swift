//
//  RootViewController1.swift
//  PRRxSwift
//
//  Created by 이건준 on 2022/01/02.
//

import UIKit
import RxSwift

class RootViewController1:UIViewController{
    //MARK: -Properties
    var disposeBag:DisposeBag = DisposeBag()
    var ob1:Observable<String?> = Observable.from(["이", "건", "준"])
    var ob2:Observable<Int?> = Observable.just(123)
    
    //MARK: -Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        let observable = Observable.of("A", "B", "C")
             
             // 2
             let subscription = observable.subscribe({ (event) in
                 print(event)
             })
        let subject = BehaviorSubject<String>(value: "")
        
        
        
        Observable.of(1, 2, 3)
            .subscribe({ event in
                if let element = event.element{
                    print("\(element)")
                }
            })
            .disposed(by: disposeBag)
        
//        Observable.zip(ob1, ob2)
//            .subscribe(onNext: { str in
//                print("str = \(str)")
//            })
//            .disposed(by: disposeBag)
//        createObservable()
//            .subscribe { event in
//                switch event{
//                case .next(let next):
//                    print("next = \(next)")
//                case .completed:
//                    print("completed")
//                case .error(let err):
//                    print("err = \(err.localizedDescription)")
//                }
//            }
        
//        Observable.just("안녕하세요")
//            .subscribe(onNext: { str in
//                print(str)
//            })
//            .disposed(by: disposeBag)
//
//        Observable.from([10, 4])
//            .map({ a in
//                a+3
//            })
//            .subscribe(onNext: {str in
//                print(str)
//            })
//
//        Observable.from(["이건주", "이건준", "이광일", "강은숙"])
//            .observe(on: ConcurrentDispatchQueueScheduler(qos: .default))
//            .map { str in
//                str.count
//            }
//            .subscribe { event in
//                switch event{
//                case .next(let next):
//                    print("next = \(next)")
//                case .error(let err):
//                    print("err = \(err.localizedDescription)")
//                case .completed:
//                    print("completed")
//                }
//            }

    }
    func createObservable()->Observable<String?>{
        return Observable.create() { k in 
            k.onNext("이건준")
            k.onCompleted()
            return Disposables.create()
        }
    }
    //MARK: -Configure
    func configureUI(){
        view.backgroundColor = .systemBackground
    }
}
