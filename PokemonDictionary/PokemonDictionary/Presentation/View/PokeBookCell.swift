//
//  PokeBookCell.swift
//  PokemonDictionary
//
//  Created by 이건준 on 2022/03/04.
//

import UIKit

class PokeBookCell: UICollectionViewCell {
    
    static let identifier = "PokebookCell"
    
    let pokeImageView = PokeImageView()
    let pokeNameLabel = PokeNameLabel()
    let pokeTypeLabel = PokeTypeLabel()
    let visualEffectView = UIVisualEffectView()
    var currentPoke: PokeBookModel?
    
    override var isHighlighted: Bool {
        didSet{
            if isHighlighted {
                //print("tapped")
                //tapped
                self.layer.borderWidth = 2
                self.layer.borderColor = UIColor.gray.cgColor
            }else if !isHighlighted {
                //print("no tapped")
                //none tapped
                DispatchQueue.main.asyncAfter(deadline: .now()+1) {
                    self.layer.borderWidth = 0
                    self.layer.borderColor = UIColor.systemPink.cgColor
                }
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .systemRed
        layout()
        attribute()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        pokeImageView.image = nil
        pokeNameLabel.text = nil
        pokeTypeLabel.text = nil
        visualEffectView.effect = nil
    }
    
    func layout() {
        addSubview(pokeImageView)
//        pokeImageView.translatesAutoresizingMaskIntoConstraints = false
//        pokeImageView.rightAnchor.constraint(equalTo: rightAnchor, constant: 10).isActive = true
//        pokeImageView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
//        pokeImageView.widthAnchor.constraint(equalToConstant: (frame.width / 3) * 2).isActive = true
//        pokeImageView.heightAnchor.constraint(equalToConstant: (frame.height / 3) * 2).isActive = true
        pokeImageView.snp.makeConstraints { make in
            make.right.equalTo(self).offset(10)
            make.bottom.equalTo(self)
            make.width.equalTo((frame.width / 3) * 2)
            make.height.equalTo((frame.height / 3) * 2)
        }
        
        addSubview(pokeNameLabel)
//        pokeNameLabel.translatesAutoresizingMaskIntoConstraints = false
//        pokeNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
//        pokeNameLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 10).isActive = true
        pokeNameLabel.snp.makeConstraints { make in
            make.top.equalTo(self).offset(10)
            make.left.equalTo(self).offset(10)
        }
        
        addSubview(visualEffectView)
//        visualEffectView.translatesAutoresizingMaskIntoConstraints = false
//        visualEffectView.leftAnchor.constraint(equalTo: leftAnchor, constant: 10).isActive = true
//        visualEffectView.centerYAnchor.constraint(equalTo: pokeImageView.centerYAnchor).isActive = true
        visualEffectView.snp.makeConstraints { make in
            make.left.equalTo(self).offset(10)
            make.centerY.equalTo(pokeImageView.snp.centerY)
        }
        
        addSubview(pokeTypeLabel)
//        pokeTypeLabel.translatesAutoresizingMaskIntoConstraints = false
//        pokeTypeLabel.centerYAnchor.constraint(equalTo: pokeImageView.centerYAnchor).isActive = true
//        pokeTypeLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: -12).isActive = true
//        pokeTypeLabel.widthAnchor.constraint(equalToConstant: (frame.width / 3) * 2).isActive = true
//        pokeTypeLabel.heightAnchor.constraint(equalToConstant: (frame.height / 3) * 2).isActive = true
        pokeTypeLabel.snp.makeConstraints { make in
            make.centerY.equalTo(pokeImageView.snp.centerY)
            make.left.equalTo(self).offset(-12)
            make.width.equalTo((frame.width / 3) * 2)
            make.height.equalTo((frame.height / 3) * 2)
        }
    }
    
    func attribute() {
        layer.cornerRadius = 15
        let blurEffect = UIBlurEffect(style: .light)
        visualEffectView.effect = blurEffect
        visualEffectView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        visualEffectView.heightAnchor.constraint(equalToConstant: 20).isActive = true
        visualEffectView.layer.cornerRadius = 10
        visualEffectView.clipsToBounds = true
        
        makeShadow(view: self)
        makeShadow(view: pokeImageView)
//        makeShadow(view: pokeNameLabel)
//        makeShadow(view: pokeTypeLabel)
    }
    
    func configureUI(item: PokeBookModel) {
        pokeImageView.fetchImage(imageUrl: item.imageUrl)
        pokeNameLabel.text = item.name.fetchFirstUpperCased()
        pokeTypeLabel.text = item.type.toString
        currentPoke = item
        backgroundColor = item.type.getPokeColor
    }
    
    
}

extension PokeBookCell {
    //MARK: -PokeImageView Component
    class PokeImageView: UIImageView {
        
        override init(frame: CGRect = .zero) {
            super.init(frame: frame)
            contentMode = .scaleAspectFit
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }
    
    //MARK: -PokeNameLabel Component
    class PokeNameLabel: UILabel {
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            textColor = .white
            font = UIFont.boldSystemFont(ofSize: 15)
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }
    
    //MARK: -PokeTypeLabel Component
    class PokeTypeLabel: UILabel {
        
        override init(frame: CGRect) {
            super.init(frame: frame)
//            layout()
            attribute()
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        func attribute() {
            textColor = .white
            layer.cornerRadius = 10
            textAlignment = .center
            font = UIFont.boldSystemFont(ofSize: 15)
//            layer.borderWidth = 1
//            layer.borderColor = UIColor.white.cgColor
            
//            let visualEffect = UIBlurEffect(style: .regular)
//            visualEffectView.effect = visualEffect
//            visualEffectView.layer.cornerRadius = 10
//            visualEffectView.alpha = 1
        }
    }
}
