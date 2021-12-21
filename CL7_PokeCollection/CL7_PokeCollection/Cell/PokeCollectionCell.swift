//
//  PokeCollectionCell.swift
//  CL7_PokeCollection
//
//  Created by 이건준 on 2021/12/22.
//

import UIKit

class PokeCollectionCell:UICollectionViewCell{
    //MARK: -UI Component
    private lazy var pokeImageView:UIImageView={
       let vw = UIImageView()
        vw.widthAnchor.constraint(equalToConstant: self.frame.width).isActive = true
        vw.heightAnchor.constraint(equalToConstant: self.frame.height-pokeLabel.frame.height).isActive = true
        vw.contentMode = .scaleAspectFit
        vw.tag = 1 //private하기때문에 바깥에서 참조하기위한 태그
        return vw
    }()
    
    private lazy var pokeLabel:UILabel={
       let lb = UILabel()
        lb.widthAnchor.constraint(equalToConstant: self.frame.width).isActive = true
        lb.heightAnchor.constraint(equalToConstant: 10).isActive = true
        lb.tag = 2
        return lb
    }()
    
    //MARK: -Init
    override init(frame: CGRect) {
        super.init(frame: frame)
    
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: -Configure
    func configure(){
        self.backgroundColor = .systemGray
        
        self.addSubview(pokeImageView)
        pokeImageView.translatesAutoresizingMaskIntoConstraints = false
        pokeImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        pokeImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        
        self.addSubview(pokeLabel)
        pokeLabel.translatesAutoresizingMaskIntoConstraints = false
        pokeLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        pokeLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
}
