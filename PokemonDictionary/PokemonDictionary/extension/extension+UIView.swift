//
//  extension+UIView.swift
//  PokemonDictionary
//
//  Created by 이건준 on 2022/03/14.
//

import UIKit

extension UIView {
    func makeShadow(view: UIView) {
        view.layer.shadowRadius = 1
        view.layer.shadowOffset = CGSize(width: 2, height: 2)
        view.layer.shadowOpacity = 1
        view.layer.shadowColor = UIColor.black.cgColor
    }
}
