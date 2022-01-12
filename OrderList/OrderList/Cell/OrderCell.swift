//
//  OrderCell.swift
//  OrderList
//
//  Created by 이건준 on 2022/01/09.
//

import UIKit

class OrderCell:UITableViewCell{
    //MARK: -
    let orderViewModel:OrderViewModel = OrderViewModel()
    var onChange:((Int)->Void)?
    
    //MARK: -Identifier
    static let identifier = "orderCell"
    
    //MARK: -UI Components
    private lazy var plusButton:UIButton={
        let btn = UIButton(type: UIButton.ButtonType.system)
        btn.setTitle("+", for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 25)
        btn.tintColor = .black
        btn.addTarget(self, action: #selector(tappedButton(_:)), for: UIControl.Event.touchUpInside)
        return btn
    }()
    
    private lazy var minusButton:UIButton={
        let btn = UIButton(type: UIButton.ButtonType.system)
        btn.setTitle("-", for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 25)
        btn.tintColor = .black
        btn.addTarget(self, action: #selector(tappedButton(_:)), for: UIControl.Event.touchUpInside)
        return btn
    }()
    
    lazy var orderName:UILabel={
       let lb = UILabel()
        lb.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        return lb
    }()
    
    lazy var orderCount:UILabel={
       let lb = UILabel()
        lb.font = UIFont.systemFont(ofSize: 20)
        return lb
    }()
    
    lazy var priceLabel:UILabel={
       let lb = UILabel()
        lb.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        return lb
    }()
    
    //MARK: -Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configureUI()
        self.selectionStyle = .none
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: -Configure
    func configureUI(){
        self.contentView.addSubview(plusButton)
        plusButton.translatesAutoresizingMaskIntoConstraints = false
        plusButton.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        plusButton.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10).isActive = true
        
        self.contentView.addSubview(minusButton)
        minusButton.translatesAutoresizingMaskIntoConstraints = false
        minusButton.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        minusButton.leftAnchor.constraint(equalTo: plusButton.rightAnchor, constant: 5).isActive = true
        
        self.addSubview(orderName)
        orderName.translatesAutoresizingMaskIntoConstraints = false
        orderName.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        orderName.leftAnchor.constraint(equalTo: minusButton.rightAnchor, constant: 10).isActive = true
        
        self.addSubview(priceLabel)
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        priceLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20).isActive = true
        
        self.addSubview(orderCount)
        orderCount.translatesAutoresizingMaskIntoConstraints = false
        orderCount.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        orderCount.leftAnchor.constraint(equalTo: self.orderName.rightAnchor, constant: 7).isActive = true
    }
    
    //MARK: -Action
    @objc func tappedButton(_ sender:UIButton){
        switch sender.titleLabel?.text{
            case "+":
                onChange?(1)
            case "-":
                onChange?(-1)
            default:
                onChange?(0)
        }
    }
}
