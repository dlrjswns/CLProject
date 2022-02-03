//
//  BaseViewController.swift
//  StockTutorial
//
//  Created by 이건준 on 2022/02/01.
//

import UIKit
import RxSwift
import Combine

class BaseViewController:UIViewController{ //BaseViewController를 만들어주는 이유는 UIViewController를 생성할때마다 항상 쓰이는 코드들의 중복을 방지하기위함
    
    let disposeBag = DisposeBag()
    var subscriber:Set<AnyCancellable> = .init()
    private var scrollView:UIScrollView?
    
    func enableScrollWhenKeyboardAppeared(scrollView:UIScrollView){
        self.scrollView = scrollView
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notificaton:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    func removeListeners(){
        NotificationCenter.default.removeObserver(self)
    }
    
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
    
    @objc private func keyboardWillShow(notificaton: NSNotification){
        guard let scrollView = scrollView else {return}
        guard let userInfo = notificaton.userInfo else {return}
        
        var keyboardFrame:CGRect = (userInfo[UIResponder.keyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
        keyboardFrame = self.view.convert(keyboardFrame, from: nil)
        
        var contentInset:UIEdgeInsets = scrollView.contentInset
        contentInset.bottom = keyboardFrame.size.height + 20
        scrollView.contentInset = contentInset
    }
    
    @objc private func keyboardWillHide(notification:NSNotification){
        guard let scrollView = scrollView else {return}
        let contentInset:UIEdgeInsets = .zero
        scrollView.contentInset = contentInset
    }
}
