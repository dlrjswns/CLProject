//
//  RSSReaderViewCell.swift
//  CL8_SimpleRSSReader
//
//  Created by 이건준 on 2021/12/28.
//

import UIKit

class RSSReaderViewCell:UITableViewCell{
    lazy var title:UILabel={
        let lb = UILabel()
        lb.widthAnchor.constraint(equalToConstant: self.frame.width).isActive = true
        lb.font = UIFont.systemFont(ofSize: 30, weight: UIFont.Weight.bold)
        lb.numberOfLines = 3
        lb.lineBreakMode = .byTruncatingTail
        return lb
    }()
    
    lazy var descriptionLabel:UILabel={
       let lb = UILabel()
        lb.numberOfLines = 3
        lb.lineBreakMode = .byTruncatingTail
        lb.widthAnchor.constraint(equalToConstant: self.frame.width).isActive = true
        return lb
    }()
    
    lazy var pubDate:UILabel={
       let lb = UILabel()
        lb.widthAnchor.constraint(equalToConstant: self.frame.width).isActive = true
        lb.textAlignment = .left
        return lb
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(){
        self.addSubview(title)
        title.translatesAutoresizingMaskIntoConstraints = false
        title.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        title.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        
        self.addSubview(pubDate)
        pubDate.translatesAutoresizingMaskIntoConstraints = false
        pubDate.centerXAnchor.constraint(equalTo: title.centerXAnchor).isActive = true
        pubDate.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 10).isActive = true
        
        self.addSubview(descriptionLabel)
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.centerXAnchor.constraint(equalTo: pubDate.centerXAnchor).isActive = true
        descriptionLabel.topAnchor.constraint(equalTo: pubDate.bottomAnchor, constant: 10).isActive = true
        descriptionLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true //UITableView.autoDimension을 위한 코드
    }
}
