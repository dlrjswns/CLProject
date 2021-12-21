//
//  DetailController.swift
//  CL1_GoodAsOldPhones
//
//  Created by 이건준 on 2021/12/03.
//

import UIKit

class DetailController:UIViewController{
    var product:Product?
    
    private lazy var addButton:UIButton={
        let btn = UIButton(type: UIButton.ButtonType.system)
        btn.setTitle("ADD TO CART", for: UIControl.State.normal)
        btn.titleLabel?.font = UIFont.italicSystemFont(ofSize: 30)
        btn.tintColor = .white
        btn.backgroundColor = .systemGreen
        return btn
    }()
    
    private lazy var bigImageView:UIImageView={
        let vw = UIImageView()
        if let bgName = product?.bigImageName{
            vw.image = UIImage(named: bgName)
        }
        return vw
    }()
    
    private lazy var titleLb:UILabel={
        let lb = UILabel()
        lb.text = product?.title
        lb.font = UIFont.systemFont(ofSize: 20, weight: UIFont.Weight.heavy)
        return lb
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemGray
        configure()
    }
    
    // MARK: -Configure
    func configure(){
        self.view = bigImageView
        
        view.addSubview(titleLb)
        titleLb.translatesAutoresizingMaskIntoConstraints = false
        titleLb.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        titleLb.topAnchor.constraint(equalTo: view.topAnchor, constant: 120).isActive = true
        
        view.addSubview(addButton)
        addButton.translatesAutoresizingMaskIntoConstraints = false
        addButton.centerXAnchor.constraint(equalTo: titleLb.centerXAnchor).isActive = true
        addButton.topAnchor.constraint(equalTo: titleLb.bottomAnchor, constant: 30).isActive = true
//        view.addSubview(bigImageView)
//        bigImageView.translatesAutoresizingMaskIntoConstraints = false
//        bigImageView.centerXAnchor.constraint(equalTo: addButton.centerXAnchor).isActive = true
//        bigImageView.topAnchor.constraint(equalTo: addButton.bottomAnchor, constant: 20).isActive = true
    }
    
}
