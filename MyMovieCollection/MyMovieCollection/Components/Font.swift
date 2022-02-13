//
//  Font.swift
//  MyMovieCollection
//
//  Created by 이건준 on 2022/02/11.
//

import UIKit

class NormalBoldLabel: UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)
        font = UIFont.systemFont(ofSize: 15, weight: .bold)
//        lineBreakMode = .byTruncatingTail
//        translatesAutoresizingMaskIntoConstraints = false
//        widthAnchor.constraint(equalToConstant: 170).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


