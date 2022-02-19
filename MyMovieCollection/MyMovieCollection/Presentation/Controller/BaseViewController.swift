//
//  BaseViewController.swift
//  MyMovieCollection
//
//  Created by 이건준 on 2022/02/10.
//

import UIKit
import Combine
import RxSwift

class BaseViewController: UIViewController {
    var subscriber: Set<AnyCancellable> = .init()
    var disposeBag: DisposeBag = .init()
    
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
    
    func configureUI() {
        view.backgroundColor = .systemBackground
    }
    
//    func dismissKeyboardWhenTappedAround(selfView: UIView) {
//        let tap = UITapGestureRecognizer(target: selfView, action: #selector(UIView.endEditing(_:)))
//        view.addGestureRecognizer(tap)
//    }
//    
//    @objc func dismissKeyboard() {
//
//    }
}

