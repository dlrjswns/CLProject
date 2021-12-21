//
//  DetailSearchController.swift
//  CL6_CandySearch
//
//  Created by 이건준 on 2021/12/20.
//

import UIKit

class DetailSearchController:UIViewController{
    //MARK: -Property
    var candy:Candy? 
    
    //MARK: -UI Component
    private lazy var candyLabel:UILabel={
        let lb = UILabel()
        lb.text = candy?.candyName
        lb.font = UIFont.systemFont(ofSize: 30, weight: UIFont.Weight.bold)
        return lb
    }()
    
    private lazy var candyView:UIImageView={
       let vw = UIImageView()
        vw.image = candy?.candyImage
        return vw
    }()
    
    //MARK: -Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = candy?.candyType
        configure()
    }
    
    //MARK: -Configure
    func configure(){
        view.backgroundColor = .systemBackground
        
        view.addSubview(candyLabel)
        candyLabel.translatesAutoresizingMaskIntoConstraints = false
        candyLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        candyLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30).isActive = true
        
        view.addSubview(candyView)
        candyView.translatesAutoresizingMaskIntoConstraints = false
        candyView.centerXAnchor.constraint(equalTo: candyLabel.centerXAnchor).isActive = true
        candyView.topAnchor.constraint(equalTo: candyLabel.bottomAnchor, constant: 70).isActive = true
    }
}
