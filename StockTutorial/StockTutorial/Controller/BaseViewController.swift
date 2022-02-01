//
//  BaseViewController.swift
//  StockTutorial
//
//  Created by 이건준 on 2022/02/01.
//

import UIKit
import RxSwift

class BaseViewController:UIViewController{ //BaseViewController를 만들어주는 이유는 UIViewController를 생성할때마다 항상 쓰이는 코드들의 중복을 방지하기위함
    
    let disposeBag = DisposeBag()
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    func configureUI(){
        view.backgroundColor = .systemBackground
    }
}
