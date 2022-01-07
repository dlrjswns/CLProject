//
//  RXViewController.swift
//  PRRxSwift
//
//  Created by 이건준 on 2022/01/04.
//

import UIKit
import RxSwift

class RXViewController:UIViewController{
    var disposeBag:DisposeBag = DisposeBag()
    
    let idValid:BehaviorSubject<Bool> = BehaviorSubject(value: false)
    let pwValid:BehaviorSubject<Bool> = BehaviorSubject(value: false)
    
    //MARK: -UI Components
    private lazy var idTextField:UITextField={
        let tf = UITextField()
        tf.placeholder = "  E-mail"
        tf.font = UIFont.systemFont(ofSize: 15)
        tf.layer.borderWidth = 1
        tf.layer.borderColor = UIColor.systemGray.cgColor
        tf.layer.cornerRadius = 5
        tf.widthAnchor.constraint(equalToConstant: view.frame.width - 20).isActive = true
        tf.heightAnchor.constraint(equalToConstant: 40).isActive = true
        tf.addSubview(idView)
        idView.translatesAutoresizingMaskIntoConstraints = false
        idView.rightAnchor.constraint(equalTo: tf.rightAnchor, constant: -5).isActive = true
        idView.topAnchor.constraint(equalTo: tf.topAnchor, constant: 5).isActive = true
        return tf
    }()
    
    private lazy var pwTextField:UITextField={
        let tf = UITextField()
        tf.placeholder = "  Password"
        tf.font = UIFont.systemFont(ofSize: 15)
        tf.layer.borderWidth = 1
        tf.layer.borderColor = UIColor.systemGray.cgColor
        tf.layer.cornerRadius = 5
        tf.widthAnchor.constraint(equalToConstant: view.frame.width - 20).isActive = true
        tf.heightAnchor.constraint(equalToConstant: 40).isActive = true
        tf.addSubview(pwView)
        pwView.translatesAutoresizingMaskIntoConstraints = false
        pwView.rightAnchor.constraint(equalTo: tf.rightAnchor, constant: -5).isActive = true
        pwView.topAnchor.constraint(equalTo: tf.topAnchor, constant: 5).isActive = true
        return tf
    }()
    
    private lazy var idView:UIView={
       let vw = UIView()
        vw.backgroundColor = .systemRed
        vw.widthAnchor.constraint(equalToConstant: 7).isActive = true
        vw.heightAnchor.constraint(equalToConstant: 7).isActive = true
        return vw
    }()
    
    private lazy var pwView:UIView={
        let vw = UIView()
        vw.backgroundColor = .systemRed
        vw.widthAnchor.constraint(equalToConstant: 7).isActive = true
        vw.heightAnchor.constraint(equalToConstant: 7).isActive = true
         return vw
    }()
    
    private lazy var loginButton:UIButton={
        let btn = UIButton(type: UIButton.ButtonType.system)
        btn.setTitle("LOG IN", for: UIControl.State.normal)
        btn.backgroundColor = .systemBlue
        btn.tintColor = .white
        btn.widthAnchor.constraint(equalToConstant: view.frame.width - 20).isActive = true
        btn.heightAnchor.constraint(equalToConstant: 40).isActive = true
        return btn
    }()
    
    //MARK: -Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Login"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        configureUI()
        bindUI()
    }
    
    func configureUI(){
        view.backgroundColor = .systemBackground
        
        view.addSubview(idTextField)
        idTextField.translatesAutoresizingMaskIntoConstraints = false
        idTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        idTextField.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        
        view.addSubview(pwTextField)
        pwTextField.translatesAutoresizingMaskIntoConstraints = false
        pwTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        pwTextField.topAnchor.constraint(equalTo: idTextField.bottomAnchor, constant: 10).isActive = true
        
        view.addSubview(loginButton)
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loginButton.topAnchor.constraint(equalTo: pwTextField.bottomAnchor, constant: 10).isActive = true
    }
    
    func bindUI(){
        let idInputOb = idTextField.rx.text.orEmpty.asObservable()
        idInputOb.map(checkEmail(_:)).bind(to: idValid).disposed(by: disposeBag)
        
        let pwInputOb = pwTextField.rx.text.orEmpty.asObservable()
        pwInputOb.map(checkPassword(_:)).bind(to: pwValid).disposed(by: disposeBag)
        
//        idValidOb.subscribe(onNext: {b in self.idView.isHidden = b})
//            .disposed(by: disposeBag)
//        pwValidOb.subscribe(onNext: {b in self.pwView.isHidden = b})
//            .disposed(by: disposeBag)
        
        
        idTextField.rx.text
            .orEmpty
            .map(checkEmail)
            .subscribe (onNext: { s in
                self.idView.isHidden = s
            })
            .disposed(by: disposeBag)
        
        pwTextField.rx.text
            .orEmpty
            .map(checkPassword)
            .subscribe (onNext: { s in
                self.pwView.isHidden = s
            })
            .disposed(by: disposeBag)
        
        Observable.combineLatest( idTextField.rx.text
                                    .orEmpty
                                    .map(checkEmail),
                                  pwTextField.rx.text
                                    .orEmpty
                                    .map(checkPassword),
                                  resultSelector: {s1, s2 in s1 && s2})
            .subscribe(onNext: {b in
                self.loginButton.isEnabled = b
            })
            .disposed(by: disposeBag)
        
//        guard let idText = idTextField.text,
//              let pwText = pwTextField.text else {return}
//
//        Observable.from([idText, pwText])
//            .filter {checkEmail(email: idText)}
//            .
//            .filter {checkPassword(password: pwText)}
//            .
    }
    
    func checkEmail(_ email:String)->Bool{
        return email.contains("@")&&email.contains(".")
    }
    
    func checkPassword(_ password:String)->Bool{
        return password.count>5
    }
}
