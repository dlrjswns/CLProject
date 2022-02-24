////
////  PRViewController.swift
////  PRRxSwift
////
////  Created by 이건준 on 2022/01/16.
////
//
//import UIKit
//import RxSwift
//import RxRelay
//
//enum CustomError:Error{
//    case defaultError
//}
//struct Student {
//     var score: BehaviorSubject<Int>
// }
//class PRViewController:UIViewController{
//    var subject = BehaviorSubject<String>(value: "").share()
//    var subject1 = PublishSubject<Int>()
//    var disposeBag = DisposeBag()
//    var ob = Observable.of(1, 2, 3, 4).share()
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        view.backgroundColor = .systemBackground
////        subject.onNext("엥 뭐야 시발")
//        
//        let disposeBag = DisposeBag()
//             
//        print(Date().timeIntervalSinceReferenceDate)
////        let a = BehaviorSubject(value: 1)
////        let b = BehaviorSubject(value: 2)
////
////        let subject = PublishSubject<BehaviorSubject<Int>>()
////
////        subject
////            .flatMap{$0}
////            .subscribe(onNext:{print($0)})
////            .disposed(by: disposeBag)
////
////        subject.onNext(a)
////        subject.onNext(b)
////
////             let ryan = Student(score: BehaviorSubject(value: 80))
////             let charlotte = Student(score: BehaviorSubject(value: 90))
////
////             let student = PublishSubject<Student>()
////
////             student
////                 .flatMapLatest {
////                     $0.score
////             }
////                 .subscribe(onNext: {
////                     print($0)
////                 })
////                 .disposed(by: disposeBag)
////
////             student.onNext(ryan)
////             ryan.score.onNext(85)
////
////             student.onNext(charlotte)
////
////             // 1
////             ryan.score.onNext(95)
////             charlotte.score.onNext(100)
//        
////        ob
////            .map { str in
////                str + 10
////            }
////            .debug("첫번째")
////            .subscribe(onNext:{str in
////                print("str = \(str)")
////            })
////            .disposed(by: disposeBag)
////
////        ob
////            .map { str in
////                str + 13
////            }
////            .debug("두번째")
////            .subscribe(onNext:{str in
////                print("str1 = \(str)")
////            })
////            .disposed(by: disposeBag)
////        subject.element(at: 2)
////            .subscribe(onNext:{str in
////                print("onNext = \(str)")
////            })
////            .disposed(by: disposeBag)
////
////        subject.onNext("1")
////        subject.onNext("2")
////        subject.onNext("3")
////        subject.onNext("5")
////        subject.onNext("1")
////        subject.onNext("1")
////        subject.onNext("1")
////        let subject = ReplaySubject<String>.create(bufferSize: 2)
////             let disposeBag = DisposeBag()
////
////             // 2
////             subject.onNext("1")
////             subject.onNext("2")
////             subject.onNext("3")
////
////             // 3
////             subject
////                 .subscribe {
////                     print("1)", $0)
////                 }
////                 .disposed(by: disposeBag)
////
////             subject
////                 .subscribe {
////                    print("2)", $0)
////                 }
////                 .disposed(by: disposeBag)
////
////        subject.onNext("4")
////
////             subject.subscribe {
////                print("4)", $0)
////                 }
////                 .disposed(by: disposeBag)
//        
//        
////        subject.onError(CustomError.defaultError)
////        subject.onCompleted()
////        subject.subscribe{print("new = \($0)")}
////            .disposed(by: disposeBag)
//
////        let subject = BehaviorSubject<String>(value: "initaial value")
////
////             subject.onNext("Is anyone listening?")
////
////             let subscriptionOne = subject
////                 .subscribe(onNext: { (string) in
////                     print(string)
////                 })
////             subject.on(.next("1"))
////             subject.onNext("2")
////
////             // 1
////             let subscriptionTwo = subject
////                 .subscribe({ (event) in
////                     print("2)", event.element ?? event)
////                 })
////
////             // 2
////             subject.onNext("3")
////
////             // 3
////             subscriptionOne.dispose()
////             subject.onNext("4")
////
////             // 4
////             subject.onError(CustomError.defaultError)
////
////             // 5
////             subject.onNext("5")
////
////             // 6
////             subscriptionTwo.dispose()
////
////             let disposeBag = DisposeBag()
////
////             // 7
////             subject
////                 .subscribe {
////                     print("3)", $0.element ?? $0)
////             }
////                 .disposed(by: disposeBag)
////
////             subject.onNext("?")
////        let str = "안녕하세요"
////
//////        Observable.just(1234)
//////            .do(onNext: {number in
//////                 print("\(number + 123)")
//////            })
//////            .debug("디버그")
//////            .subscribe(onNext:{str in
//////                print("str = \(str)")
//////            })
//////            .disposed(by: disposeBag)
////
////        subject.subscribe { emitter in
////            switch emitter{
////            case .next(let str):
////                print("onNext = \(str)")
////            case .completed:
////                print("onCompleted")
////            case .error(let err):
////                print("onError = \(err.localizedDescription)")
////            }
////        }
////        .disposed(by: disposeBag)
////
////        let btn = UIButton(type: UIButton.ButtonType.system)
////        btn.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
////        btn.setTitle("이동", for: .normal)
////        btn.addTarget(self, action: #selector(tappedButton), for: .touchUpInside)
////        view.addSubview(btn)
////        btn.center = view.center
//    }
//    
//    @objc func tappedButton(){
////        subject.onNext("이건준")
//        navigationController?.pushViewController(NextViewController(), animated: false)
//    }
//}
