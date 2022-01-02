//
//  PhotoCell.swift
//  CL9_PhotoScroll
//
//  Created by 이건준 on 2021/12/30.
//

import UIKit

class PhotoCell:UICollectionViewCell{
    //MARK: -ReuseIdentifier
    static let reuseIdentifier = "photoCell"
    
    //MARK: -UI Components
    private lazy var photoView:UIImageView={
       let vw = UIImageView()
        vw.contentMode = .scaleAspectFit
        vw.widthAnchor.constraint(equalToConstant: self.frame.width).isActive = true
        vw.heightAnchor.constraint(equalToConstant: self.frame.height).isActive = true
        return vw
    }()
    
    //MARK: -Setter
    var setPhotoViewImage:String?{
        didSet{
            if let photoImageName = setPhotoViewImage,
               let attemptImage = UIImage(named: photoImageName){
                    photoView.image = attemptImage
              }
        }
    }
    
    //MARK: -Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: -Configure
    func configure(){
        self.addSubview(photoView)
        photoView.translatesAutoresizingMaskIntoConstraints = false
        photoView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        photoView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    }
}
