import UIKit
import RxSwift
import RxCocoa

class RootViewController: UIViewController {
    
    private let viewModel: RootViewModel
    var disposeBag = DisposeBag()
    let relayExp2 = BehaviorSubject<String>(value: "d")
    let relayExp = BehaviorSubject<String>(value: "s")
//    var observerExp: AnyObserver<String>
    
    init(viewModel: RootViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    let button = UIButton(frame: .init(x: 0, y: 0, width: 220, height: 55))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        view.addSubview(button)
        button.center = view.center
        button.setTitle("bind", for: .normal)
        button.setTitleColor(.systemPink, for: .normal)
        button.addTarget(self, action: #selector(bind), for: .touchUpInside)
        
        let sig = relayExp.asSignal(onErrorJustReturn: "")
        let dri = relayExp2.asDriver(onErrorJustReturn: "")
        
        sig.emit(onNext: { str in
            print("signal = \(str)")
        }).disposed(by: disposeBag)
        
        dri.drive(onNext: { str in
            print("driver = \(str)")
        }).disposed(by: disposeBag)
        
        relayExp2.onNext("dri1")
        relayExp2.onNext("dri2")
        relayExp.onNext("sig1")
        relayExp.onNext("sig2")
    
    }
    
    func configureUI() {
        view.backgroundColor = .systemBackground
    }
    
    @objc func bind() {
        print("tap")
        
//        viewModel.createSingle().subscribe(onSuccess: { str in
//            print("single onSuccess called - \(str)")
//        }, onFailure: { err in
//            print("single onFailure called - \(err.localizedDescription)")
//        }, onDisposed: {
//            print("single onDisposed called")
//        }).disposed(by: disposeBag)
    }
}
