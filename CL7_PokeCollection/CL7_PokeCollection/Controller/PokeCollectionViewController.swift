//
//  PokeCollectionViewController.swift
//  CL7_PokeCollection
//
//  Created by 이건준 on 2021/12/22.
//

import UIKit

class PokeCollectionViewController:UICollectionViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = .systemBackground
        setCollectionView()
    }
    
    //MARK: -Set CollectionView
    func setCollectionView(){
        self.collectionView.delegate = self // 명시하기위한 코드
        self.collectionView.dataSource = self
        self.collectionView.register(PokeCollectionCell.self, forCellWithReuseIdentifier: "cell")
    }
}

//MARK: -UICollectionViewDataSource
extension PokeCollectionViewController{
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! PokeCollectionCell
        if let pokeLabel = cell.viewWithTag(1) as? UILabel,
           let pokeImageView = cell.viewWithTag(2) as? UIImageView{//이 부분 nil나옴, 확인필요
            pokeLabel.text = "Trash Data"
            pokeImageView.image = UIImage(systemName: "person.fill")
            print("success ??")
        }
        print("fail")
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
}

//MARK: -UICollectionViewDelegate
extension PokeCollectionViewController:UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 50, height: 50)
    }
}
