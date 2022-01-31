//
//  RootViewController1.swift
//  PRRxSwift
//
//  Created by 이건준 on 2022/01/02.
//

import UIKit
import RxSwift
import RxDataSources

struct CustomData {
  var anInt: Int
  var aString: String
  var aCGPoint: CGPoint
}
struct SectionOfCustomData {
  var header: String
  var items: [Item]
}
extension SectionOfCustomData: SectionModelType {
  typealias Item = CustomData

   init(original: SectionOfCustomData, items: [Item]) {
    self = original
    self.items = items
  }
}

class RootViewController1:UIViewController, UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "이건준"
        return cell
    }
    
//    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
//        <#code#>
//    }

    
    
    //MARK: -Properties
    var disposeBag:DisposeBag = DisposeBag()
    var ob1:Observable<String?> = Observable.from(["이", "건", "준"])
    var ob2:Observable<Int?> = Observable.just(123)
    
    lazy var tableView:UITableView={
        let tb = UITableView()
//        tb.frame = UIScreen.main.bounds
//        tb.delegate = self
//        tb.dataSource = self
        return tb
    }()
    
    //MARK: -Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        self.view = tableView
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
      
        let dataSource = RxTableViewSectionedReloadDataSource<SectionOfCustomData>(
          configureCell: { dataSource, tableView, indexPath, item in
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            cell.textLabel?.text = "Item \(item.anInt): \(item.aString) - \(item.aCGPoint.x):\(item.aCGPoint.y)"
            return cell
        })
        
        dataSource.titleForHeaderInSection = { dataSource, index in
          return dataSource.sectionModels[index].header
        }


//        dataSource.canEditRowAtIndexPath = { dataSource, indexPath in
//          return true
//        }
//
//        dataSource.canMoveRowAtIndexPath = { dataSource, indexPath in
//          return true
//        }
        
        let sections = [
          SectionOfCustomData(header: "First section", items: [CustomData(anInt: 0, aString: "zero", aCGPoint: CGPoint.zero), CustomData(anInt: 1, aString: "one", aCGPoint: CGPoint(x: 1, y: 1)) ]),
          SectionOfCustomData(header: "Second section", items: [CustomData(anInt: 2, aString: "two", aCGPoint: CGPoint(x: 2, y: 2)), CustomData(anInt: 3, aString: "three", aCGPoint: CGPoint(x: 3, y: 3)) ])
        ]

        Observable.just(sections)
          .bind(to: tableView.rx.items(dataSource: dataSource))
          .disposed(by: disposeBag)
   
        
        
        
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
