//
//  PhotoViewController.swift
//  CL9_PhotoScroll
//
//  Created by 이건준 on 2022/01/02.
//

import UIKit

class PhotoViewController:UIViewController{
    var photoIndex:Int?
    
    lazy var photoView:UIImageView={
        let vw = UIImageView()
        vw.contentMode = .scaleAspectFit
        return vw
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        configureUI()
    }
    
    func configureUI(){
        view.backgroundColor = .systemBackground
        
        view.addSubview(photoView)
        self.view = photoView
    }
    
    
}
