//
//  CustomImageView.swift
//  MyMovieCollection
//
//  Created by 이건준 on 2022/02/20.
//

import UIKit

class SearchImageView: UIImageView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.image = UIImage(named: "search.png")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class SearchFillImageView: UIImageView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.image = UIImage(named: "searchFill.png")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
