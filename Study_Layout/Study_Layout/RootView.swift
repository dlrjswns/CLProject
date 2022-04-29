//
//  RootView.swift
//  Study_Layout
//
//  Created by 이건준 on 2022/03/30.
//

import UIKit

class PRCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "PRCollectionViewCell"
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .red
        imageView.image = UIImage(systemName: "sun.min")
        imageView.contentMode = .scaleAspectFit
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(imageView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        imageView.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        imageView.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }
}


class RootView: UIView {
    
    let button: UIButton = {
        let button = UIButton()
        button.setTitle("Practice", for: .normal)
//        button.setTitleColor(.label, for: .normal)
        button.backgroundColor = .systemRed
        button.tintColor = .systemBlue
        button.setTitleColor(.systemBlue, for: .selected)
        return button
    }()
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 100, height: 100)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .red
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground
        
        addSubview(collectionView)
        
        collectionView.showsHorizontalScrollIndicator = false
//        button.translatesAutoresizingMaskIntoConstraints = false
//        button.topAnchor.constraint(equalTo: topAnchor).isActive = true
        
//        button.translatesAutoresizingMaskIntoConstraints = false
//        button.topAnchor.constraint(equalTo: topAnchor).isActive = true
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
//        button.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
//        collectionView.topAnchor.constraint(equalTo: topAnchor).isActive = true
//        collectionView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
//        collectionView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
//        collectionView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        collectionView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        collectionView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        collectionView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        collectionView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width).isActive = true
        print("layoutSubviews")
    }
    
    override func updateConstraints() {
        print("RootView updateConstraints")
        super.updateConstraints()
    }
}
