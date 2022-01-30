//
//  LoginViewController.swift
//  LoginValidation
//
//  Created by 이건준 on 2022/01/30.
//

import UIKit
import MaterialComponents.MaterialTextControls_OutlinedTextFields
import MaterialComponents.MaterialButtons
import RxSwift

class LoginViewController:UIViewController{
    //MARK: -Property
    var disposeBag = DisposeBag()
    let loginViewModel = LoginViewModel()
    
    private lazy var idTextField:MDCOutlinedTextField = {
        let tf = MDCOutlinedTextField()
        tf.label.text = "id"
        tf.placeholder = "Enter your id"
        tf.leadingAssistiveLabel.text = "This is where enter your id"
        tf.heightAnchor.constraint(equalToConstant: 40).isActive = true
        tf.sizeToFit()
        return tf
    }()
    
    private lazy var pwdTextField:MDCOutlinedTextField = {
        let tf = MDCOutlinedTextField()
        tf.label.text = "pw"
        tf.placeholder = "Enter your pw"
        tf.leadingAssistiveLabel.text = "This is where enter your pw"
        tf.heightAnchor.constraint(equalToConstant: 40).isActive = true
        tf.sizeToFit()
        tf.isSecureTextEntry = true
        return tf
    }()
    
    private lazy var loginButton:MDCButton = {
        let btn = MDCButton()
        btn.setTitle("login", for: .normal)
        btn.heightAnchor.constraint(equalToConstant: 40).isActive = true
        btn.setBackgroundColor(.purple)
        btn.isUserInteractionEnabled = false
        btn.alpha = 0.3
        return btn
    }()
    
    private lazy var stack:UIStackView = {
       let stack = UIStackView(arrangedSubviews: [idTextField, pwdTextField, loginButton])
        stack.axis = .vertical
        stack.spacing = 50
        return stack
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureKeyboard()
        loginBind()
    }
    
    //MARK: -Configure
    func configureKeyboard(){
        dismissKeyboardWhenTapped()
        moveViewWhenKeyboardAppearedOrDisappeared()
    }
    
    func configureUI(){
        view.backgroundColor = .systemBackground
        
        view.addSubview(stack)
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        stack.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        stack.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
    }
    
    func loginBind(){
        self.idTextField.rx.text.map{$0 ?? ""}.bind(to: loginViewModel.idPublishSubject).disposed(by: disposeBag)
        self.pwdTextField.rx.text.map{$0 ?? ""}.bind(to: loginViewModel.pwPublishSubject).disposed(by: disposeBag)
        
        loginViewModel.isValid().subscribe(onNext:{ valid in
            self.loginButton.isUserInteractionEnabled = valid
            if valid{
                self.loginButton.alpha = 1
            }else{
                self.loginButton.alpha = 0.3
            }
        })
        .disposed(by: disposeBag)
    }
}
