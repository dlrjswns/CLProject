//
//  PokeBook+UICollectionView.swift
//  PokemonDictionary
//
//  Created by 이건준 on 2022/03/04.
//

import UIKit

extension PokeBookController: UICollectionViewDelegate {
    //PokeCell터치할때 해당 포켓몬의 정보창띄우기
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as? PokeBookCell ?? PokeBookCell()
        guard let cellData = cell.currentPoke else { return }
        coordinator?.cellTapped(cellData: cellData)
    }
    
//    func cellAnimatedWhenTapped(cell: PokeBookCell) {
//        cell.layer.borderWidth = 2.0
//        cell.layer.borderColor = UIColor.gray.cgColor
//    }
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
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
}
