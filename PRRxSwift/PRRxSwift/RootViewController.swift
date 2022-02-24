import UIKit
import RxSwift

class RootViewController: UIViewController {
    
    private let viewModel: RootViewModel
    var disposeBag = DisposeBag()
    
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
    }
    
    func configureUI() {
        view.backgroundColor = .systemBackground
    }
    
    @objc func bind() {
        viewModel.createSingle().subscribe(onSuccess: { str in
            print("single onSuccess called - \(str)")
        }, onFailure: { err in
            print("single onFailure called - \(err.localizedDescription)")
        }, onDisposed: {
            print("single onDisposed called")
        }).disposed(by: disposeBag)
    }
}
