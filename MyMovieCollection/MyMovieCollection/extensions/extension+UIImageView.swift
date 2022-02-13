//
//  Extension+UIImageView.swift
//  MyMovieCollection
//
//  Created by 이건준 on 2022/02/12.
//

import UIKit

class MemoryCacheManager {
    static let shared = NSCache<NSString, UIImage>()
    private init() {}
}

extension UIImageView {
    func loadImage(imageUrl: String) {
        let cacheKey = NSString(string: imageUrl)
        if let cacheImage = MemoryCacheManager.shared.object(forKey: cacheKey) {
            self.image = cacheImage
            return
        }
        
        if let imageUrl = URL(string: imageUrl) {
            URLSession.shared.dataTask(with: imageUrl) { data, response, error in
                if let _ = error {
                    DispatchQueue.main.async { [weak self] in
                        self?.image = UIImage()
                    }
                }
                
                DispatchQueue.main.async { [weak self] in
                if let data = data, let fetchImage = UIImage(data: data) {
                        MemoryCacheManager.shared.setObject(fetchImage, forKey: cacheKey)
                        self?.image = fetchImage
                    }
                }
            }.resume()
        }
    }
        
}
