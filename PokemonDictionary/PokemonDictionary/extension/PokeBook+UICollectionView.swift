//
//  PokeBook+UICollectionView.swift
//  PokemonDictionary
//
//  Created by 이건준 on 2022/03/04.
//

import UIKit

//extension PokeBookController: UICollectionViewDataSource {
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return 10
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PokeBookCell.identifier, for: indexPath) as? PokeBookCell ?? PokeBookCell()
//        
//        return cell
//    }
//}

extension PokeBookController: UICollectionViewDelegate {
    //PokeCell터치할때 해당 포켓몬의 정보창띄우기
}

extension PokeBookController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (UIScreen.main.bounds.width - 30) / 2, height: (UIScreen.main.bounds.height - 70) / 6)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
}
