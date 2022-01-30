//
//  MemberCell.swift
//  MemberPR
//
//  Created by 이건준 on 2022/01/07.
//

import UIKit

class MemberCell:UITableViewCell{
    lazy var nameLabel:UILabel={
       let lb = UILabel()
        return lb
    }()

    lazy var avatarImage:UIImageView={
       let vw = UIImageView()
        return vw
    }()

    lazy var jobLabel:UILabel={
       let lb = UILabel()
        return lb
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureUI(){
        self.addSubview(avatarImage)
        avatarImage.translatesAutoresizingMaskIntoConstraints = false
        avatarImage.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        avatarImage.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10).isActive = true
        
        self.addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.leftAnchor.constraint(equalTo: avatarImage.rightAnchor, constant: 10).isActive = true
        nameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 5).isActive = true
        
        self.addSubview(jobLabel)
        jobLabel.translatesAutoresizingMaskIntoConstraints = false
        jobLabel.centerXAnchor.constraint(equalTo: nameLabel.centerXAnchor).isActive = true
        jobLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5).isActive = true
    }
}
