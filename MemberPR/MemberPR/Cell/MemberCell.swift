//
//  MemberCell.swift
//  MemberPR
//
//  Created by 이건준 on 2022/01/07.
//

import UIKit

class MemberCell:UITableViewCell{
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setMemberCell(image:UIImage, text:String, detailText:String){
        self.imageView?.image = image
        self.textLabel?.text = text
        self.detailTextLabel?.text = detailText
    }
}
