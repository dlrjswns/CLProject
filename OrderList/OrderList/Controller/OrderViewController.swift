//
//  OrderViewController.swift
//  OrderList
//
//  Created by 이건준 on 2022/01/09.
//

import UIKit
import RxSwift

class OrderViewController:UIViewController{
    //MARK: -View Models
    var orderViewModel = OrderViewModel()
    var disposeBag = DisposeBag()
    
    //MARK: -UI Components
    private lazy var headerLabel:UILabel={
        let lb = UILabel()
        lb.text = "Bear Fried Center"
        lb.font = UIFont.systemFont(ofSize: 38, weight: .heavy)
        return lb
    }()
    
    private lazy var orderView:UITableView={
       let vw = UITableView()
        vw.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
        vw.heightAnchor.constraint(equalToConstant: 500).isActive = true
        return vw
    }()
    
    private lazy var inforView:UIView={
       let vw = UIView()
        vw.backgroundColor = .systemGray3
        vw.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
        vw.heightAnchor.constraint(equalToConstant: 130).isActive = true
        vw.addSubview(yourOrdersLabel)
        yourOrdersLabel.translatesAutoresizingMaskIntoConstraints = false
        yourOrdersLabel.topAnchor.constraint(equalTo: vw.topAnchor, constant: 13).isActive = true
        yourOrdersLabel.leftAnchor.constraint(equalTo: vw.leftAnchor, constant: 18).isActive = true
        
        vw.addSubview(clearButton)
        clearButton.translatesAutoresizingMaskIntoConstraints = false
        clearButton.centerYAnchor.constraint(equalTo: yourOrdersLabel.centerYAnchor).isActive = true
        clearButton.leftAnchor.constraint(equalTo: yourOrdersLabel.rightAnchor, constant: 20).isActive = true
        
        vw.addSubview(itemsLabel)
        itemsLabel.translatesAutoresizingMaskIntoConstraints = false
        itemsLabel.centerYAnchor.constraint(equalTo: clearButton.centerYAnchor).isActive = true
        itemsLabel.rightAnchor.constraint(equalTo: vw.rightAnchor, constant: -20).isActive = true
        
        vw.addSubview(itemCount)
        itemCount.translatesAutoresizingMaskIntoConstraints = false
        itemCount.centerYAnchor.constraint(equalTo: itemsLabel.centerYAnchor).isActive = true
        itemCount.rightAnchor.constraint(equalTo: itemsLabel.leftAnchor, constant: -10).isActive = true
        return vw
    }()
    
    private lazy var yourOrdersLabel:UILabel={
       let lb = UILabel()
        lb.text = "Your Orders"
        lb.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        return lb
    }()
    
    private lazy var clearButton:UIButton={
        let btn = UIButton(type: UIButton.ButtonType.system)
        btn.setTitle("Clear", for: UIControl.State.normal)
        btn.tintColor = .white
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        return btn
    }()
    
    private lazy var itemsLabel:UILabel={
       let lb = UILabel()
        lb.text = "Items"
        lb.font = UIFont.systemFont(ofSize: 20)
        return lb
    }()
    
    private lazy var itemCount:UILabel={
       let lb = UILabel()
        lb.text = "0"
        lb.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        
        return lb
    }()
    
    private lazy var orderButton:UIButton={
        let btn = UIButton(type: UIButton.ButtonType.system)
        btn.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
        btn.heightAnchor.constraint(equalToConstant: 60).isActive = true
        btn.setTitle("ORDER", for: UIControl.State.normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 30, weight: UIFont.Weight.heavy)
        btn.backgroundColor = .black
        btn.tintColor = .white
        return btn
    }()
    
    //MARK: -Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        configureUI()
        
        //RxCocoa로 tableView를 설정할때 반드시 register를 해야만한다
        orderView.register(OrderCell.self, forCellReuseIdentifier: OrderCell.identifier)
        
        orderViewModel.fetchMenus
            .observe(on: MainScheduler.instance)
            .bind(to: orderView.rx.items(cellIdentifier: OrderCell.identifier, cellType: OrderCell.self)){ index, item, cell in
//                cell.orderName.text = item.name
//                cell.priceLabel.text = "\(item.price!)"
                cell.orderName.text = item.name
                cell.priceLabel.text = "\(item.price!)"
                cell.orderCount.text = "(\(item.count!))"
                
                cell.onChange = { [weak self] increase in
                    self?.orderViewModel.changeCount(item, increase)
                }
            }
            .disposed(by: disposeBag)
            
    }
    
    //MARK: -Configure
    func configureUI(){
        view.backgroundColor = .systemBackground
        
        view.addSubview(headerLabel)
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        headerLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        headerLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        
        view.addSubview(orderView)
        orderView.translatesAutoresizingMaskIntoConstraints = false
        orderView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        orderView.topAnchor.constraint(equalTo: headerLabel.bottomAnchor).isActive = true
        
        view.addSubview(inforView)
        inforView.translatesAutoresizingMaskIntoConstraints = false
        inforView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        inforView.topAnchor.constraint(equalTo: orderView.bottomAnchor).isActive = true
        
        view.addSubview(orderButton)
        orderButton.translatesAutoresizingMaskIntoConstraints = false
        orderButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        orderButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
}
