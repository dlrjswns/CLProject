//
//  extension+UIImageView.swift
//  PokemonDictionary
//
//  Created by 이건준 on 2022/03/05.
//

import UIKit

class MemoryCacheManager {
    static let shared = NSCache<NSString, UIImage>()
    private init() {}
}

extension UIImageView {
    func fetchImage(imageUrl: String) {
        let cacheKey = NSString(string: imageUrl)
        if let cacheImage = MemoryCacheManager.shared.object(forKey: cacheKey) {
            DispatchQueue.main.async {
                self.image = cacheImage
                return
            }
        }
        
        if let url = URL(string: imageUrl) {
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let _ = error {
                    DispatchQueue.main.async {
                        self.image = UIImage()
                    }
                }
                
            DispatchQueue.main.async {
                if let data = data,
                   let fetchImage = UIImage(data: data) {
                    MemoryCacheManager.shared.setObject(fetchImage, forKey: cacheKey)
                        self.image = fetchImage
                    }
                }
            }.resume()
        }
    }
}
