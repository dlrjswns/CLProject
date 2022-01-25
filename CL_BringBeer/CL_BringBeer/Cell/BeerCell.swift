//
//  BeerCell.swift
//  CL_BringBeer
//
//  Created by 이건준 on 2022/01/22.
//

import UIKit

class BeerCell:UITableViewCell{
    //MARK: -Identifier
    static let identifier = "BeerCell"
    
    //MARK: -Cell Components
    lazy var beerImageView:UIImageView={
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        return imageView
    }()
    
    lazy var beerID:UILabel={
       let idLabel = UILabel()
        return idLabel
    }()
    
    lazy var beerName:UILabel={
       let nameLabel = UILabel()
        return nameLabel
    }()
    
    lazy var beerDescription:UILabel={
       let descriptionLabel = UILabel()
        descriptionLabel.numberOfLines = 3
//        descriptionLabel.lineBreakMode = .
        return descriptionLabel
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureUI(){
        self.addSubview(beerImageView)
        beerImageView.translatesAutoresizingMaskIntoConstraints = false
        beerImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        beerImageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10).isActive = true
        
        self.addSubview(beerID)
        beerID.translatesAutoresizingMaskIntoConstraints = false
        beerID.centerYAnchor.constraint(equalTo: beerImageView.centerYAnchor).isActive = true
        beerID.leftAnchor.constraint(equalTo: beerImageView.rightAnchor, constant: 10).isActive = true
        beerID.topAnchor.constraint(equalTo: self.topAnchor, constant: 5).isActive = true
        
        
    }
}
