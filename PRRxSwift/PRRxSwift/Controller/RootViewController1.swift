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
    //MARK: -Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        
        Observable.just("안녕하세요")
            .subscribe(onNext: { str in 
                print(str)
            })
            .disposed(by: disposeBag)
        
        Observable.from([10, 4])
            .map({ a in
                a+3
            })
            .subscribe(onNext: {str in
                print(str)
            })
        
        Observable.from(["이건주", "이건준", "이광일", "강은숙"])
            .observe(on: ConcurrentDispatchQueueScheduler(qos: .default))
            .map { str in
                str.count
            }
            .subscribe { event in
                switch event{
                case .next(let next):
                    print("next = \(next)")
                case .error(let err):
                    print("err = \(err.localizedDescription)")
                case .completed:
                    print("completed")
                }
            }

    }
    
    //MARK: -Configure
    func configureUI(){
        view.backgroundColor = .systemBackground
    }
}
