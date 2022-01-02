//
//  MainPhotoController.swift
//  CL9_PhotoScroll
//
//  Created by 이건준 on 2021/12/30.
//

import UIKit

class MainPhotoController:UICollectionViewController{
    //MARK: -Model
    let photoName:[String] = [
        "photo1.png",
        "photo2.png",
        "photo3.png",
        "photo4.png",
        "photo5.png"
    ]
    
    //MARK: -Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        setCollectionView()
        setNavigationBar()
    }
    
    //MARK: -Set NavigationBar
    func setNavigationBar(){
        self.title = "Photo Scroll"
    }
    
    //MARK: -Set CollectionView
    func setCollectionView(){
        self.collectionView.register(PhotoCell.self, forCellWithReuseIdentifier: PhotoCell.reuseIdentifier)
    }
    
    //MARK: -Configure
    func configure(){
        collectionView.backgroundColor = .systemBackground
    }
}

//MARK: -UICollectionViewDataSource
extension MainPhotoController{
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photoName.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoCell.reuseIdentifier, for: indexPath) as? PhotoCell else {return UICollectionViewCell()}
        cell.setPhotoViewImage = photoName[indexPath.row]
        
        return cell
    }
}

extension MainPhotoController:UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let length = (collectionView.frame.width-50)/4
        let cellSize:CGSize = CGSize(width: length, height: length)
        return cellSize
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = PhotoPageController(transitionStyle: .pageCurl, navigationOrientation: .horizontal, options: nil)
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
