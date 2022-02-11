//
//  EmptyView.swift
//  MyMovieCollection
//
//  Created by 이건준 on 2022/02/12.
//

import UIKit

class EmptyView: UIView {
    
    let placeholderLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(placeholderLabel)
        placeholderLabel.translatesAutoresizingMaskIntoConstraints = false
        placeholderLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
        placeholderLabel.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        placeholderLabel.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        placeholderLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        placeholderLabel.text = "No result"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

