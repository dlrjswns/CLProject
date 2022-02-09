//
//  StockDetailBottomView.swift
//  StockTutorial
//
//  Created by 이건준 on 2022/02/07.
//

import UIKit

class StockDetailBottomView: BaseView {
    
    let investInputView = InputView()
    let costInputView = InputView()
    let dateInputView = InputView()
    let slider = UISlider()
    
    override func configureUI() {
        addSubview(investInputView)
        addSubview(costInputView)
        addSubview(dateInputView)
        addSubview(slider)
        investInputView.translatesAutoresizingMaskIntoConstraints = false
        costInputView.translatesAutoresizingMaskIntoConstraints = false
        dateInputView.translatesAutoresizingMaskIntoConstraints = false
        slider.translatesAutoresizingMaskIntoConstraints = false
        
        investInputView.configureUI(placeholder: "Enter your initial investment amount", descriptionLabelText: "initial investment amount")
        costInputView.configureUI(placeholder: "Monthly dollar cost averaging amount", descriptionLabelText: "Monthly dollar cost averaging amount")
        dateInputView.configureUI(placeholder: "Enter the initial date of investment", descriptionLabelText: "Enter the initial date of investment")
        
        investInputView.topAnchor.constraint(equalTo: topAnchor, constant: 8).isActive = true
        investInputView.leftAnchor.constraint(equalTo: leftAnchor, constant: 16).isActive = true
        investInputView.rightAnchor.constraint(equalTo: rightAnchor, constant: -16).isActive = true
        investInputView.textField.keyboardType = .numberPad
        investInputView.textField.addDoneButton()
        
        costInputView.topAnchor.constraint(equalTo: investInputView.bottomAnchor, constant: 8).isActive = true
        costInputView.leftAnchor.constraint(equalTo: leftAnchor, constant: 16).isActive = true
        costInputView.rightAnchor.constraint(equalTo: rightAnchor, constant: -16).isActive = true
        costInputView.textField.keyboardType = .numberPad
        costInputView.textField.addDoneButton()
        
        dateInputView.topAnchor.constraint(equalTo: costInputView.bottomAnchor, constant: 8).isActive = true
        dateInputView.leftAnchor.constraint(equalTo: leftAnchor, constant: 16).isActive = true
        dateInputView.rightAnchor.constraint(equalTo: rightAnchor, constant: -16).isActive = true
        
        slider.topAnchor.constraint(equalTo: dateInputView.bottomAnchor, constant: 8).isActive = true
        slider.leftAnchor.constraint(equalTo: leftAnchor, constant: 16).isActive = true
        slider.rightAnchor.constraint(equalTo: rightAnchor, constant: -16).isActive = true
        slider.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16).isActive = true
    }
    
    func configureUI(currentcy: String) {
        investInputView.valueLabel.text = "(\(currentcy))"
        costInputView.valueLabel.text = "(\(currentcy))"
        dateInputView.valueLabel.text = "(\(currentcy))"
    }
    
    class InputView: BaseView { //공통으로 사용할것이기때문에 재활용성을 위해 InputView 생성
        let textField = UITextField()
        let descriptionLabel = SmallLabel()
        let valueLabel = NormalGrayLabel()
        
        override func configureUI() {
            textField.font = UIFont.systemFont(ofSize: 18)
            textField.autocorrectionType = .no
            addSubview(textField)
            addSubview(descriptionLabel)
            addSubview(valueLabel)
            textField.translatesAutoresizingMaskIntoConstraints = false
            descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
            valueLabel.translatesAutoresizingMaskIntoConstraints = false
            
            textField.topAnchor.constraint(equalTo: topAnchor).isActive = true
            textField.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
            textField.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
            
            descriptionLabel.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 8).isActive = true
            descriptionLabel.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
            descriptionLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
            
            valueLabel.centerYAnchor.constraint(equalTo: descriptionLabel.centerYAnchor).isActive = true
            valueLabel.leftAnchor.constraint(equalTo: descriptionLabel.rightAnchor, constant: 4).isActive = true
        }
        
        func configureUI(placeholder: String, descriptionLabelText: String, value: String? = "(USD)"){
            textField.placeholder = placeholder
            descriptionLabel.text = descriptionLabelText
            valueLabel.text = value
        }
    }
}
