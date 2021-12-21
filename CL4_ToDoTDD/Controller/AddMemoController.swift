//
//  AddMemoController.swift
//  CL4_ToDoTDD
//
//  Created by 이건준 on 2021/12/12.
//

import UIKit

protocol SaveDataDelegate:AnyObject{
    func saveData(data saveData:Memo)
}

class AddMemoController:UIViewController{
    var delegate:SaveDataDelegate?
    //MARK: -UI Component
    private lazy var titleTextFd:UITextField={
        let fd = UITextField()
        fd.placeholder = "Title"
        fd.layer.borderWidth = 1
        fd.layer.borderColor = UIColor.systemGray.cgColor
        fd.layer.cornerRadius = 10
        fd.widthAnchor.constraint(equalToConstant: 180).isActive = true
        fd.heightAnchor.constraint(equalToConstant: 30).isActive = true
        return fd
    }()
    
    private lazy var addressTextFd:UITextField={
        let fd = UITextField()
        fd.placeholder = "Address"
        fd.layer.borderWidth = 1
        fd.layer.borderColor = UIColor.systemGray.cgColor
        fd.layer.cornerRadius = 10
        fd.widthAnchor.constraint(equalToConstant: 180).isActive = true
        fd.heightAnchor.constraint(equalToConstant: 30).isActive = true
        return fd
    }()
    
    private lazy var dateLabel:UILabel={
       let lb = UILabel()
        lb.text = "Date"
        return lb
    }()
    
    private lazy var datePicker:UIDatePicker={
       let pk = UIDatePicker()
        pk.datePickerMode = .date
        pk.minimumDate = Date() //현재 날짜를 최소날짜로 지정
        return pk
    }()
    
    private lazy var cancelButton:UIButton={
        let btn = UIButton(type: UIButton.ButtonType.system)
        btn.setTitle("cancel" , for: UIControl.State.normal)
        btn.tintColor = .systemRed
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        return btn
    }()
    
    private lazy var saveButton:UIButton={
        let btn = UIButton(type: UIButton.ButtonType.system)
        btn.setTitle("save", for: UIControl.State.normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        btn.addTarget(self, action: #selector(tapSaveButton), for: UIControl.Event.touchUpInside)
        return btn
    }()
    
//    private lazy var da1tePicker:UIPickerView = {
//       let pk = UIPickerView()
//
//        return pk
//    }()
    
    //MARK: -For Setting
//    func setdatePicker(){
//        da1tePicker.delegate = self
//        da1tePicker.dataSource = self
//    }
    
    //MARK: -Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
    }
    
    //MARK: -Objc
    @objc func tapSaveButton(){
        let title = titleTextFd.text!
        let address = addressTextFd.text!
        let date = datePicker.date
        let data = Memo(title: title, comment: address, date: date)
        delegate?.saveData(data: data)
        self.navigationController?.popViewController(animated: true)
        print("dfds")
    }
    
    //MARK: -Configure
    func configure(){
        view.backgroundColor = .systemBackground
        
        view.addSubview(titleTextFd)
        titleTextFd.translatesAutoresizingMaskIntoConstraints = false
        titleTextFd.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        titleTextFd.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100).isActive = true
        
        view.addSubview(addressTextFd)
        addressTextFd.translatesAutoresizingMaskIntoConstraints = false
        addressTextFd.centerXAnchor.constraint(equalTo: titleTextFd.centerXAnchor).isActive = true
        addressTextFd.topAnchor.constraint(equalTo: titleTextFd.bottomAnchor, constant: 30).isActive = true
        
        view.addSubview(dateLabel)
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.centerXAnchor.constraint(equalTo: addressTextFd.centerXAnchor).isActive = true
        dateLabel.topAnchor.constraint(equalTo: addressTextFd.bottomAnchor, constant: 40).isActive = true
    
        view.addSubview(datePicker)
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        datePicker.centerXAnchor.constraint(equalTo: dateLabel.centerXAnchor).isActive = true
        datePicker.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 10).isActive = true
        
        
        view.addSubview(cancelButton)
        cancelButton.translatesAutoresizingMaskIntoConstraints = false
        cancelButton.topAnchor.constraint(equalTo: datePicker.bottomAnchor, constant: 50).isActive = true
        cancelButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 80).isActive = true
        
        view.addSubview(saveButton)
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        saveButton.topAnchor.constraint(equalTo: datePicker.bottomAnchor, constant: 50).isActive = true
        saveButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -80).isActive = true
    }
}


