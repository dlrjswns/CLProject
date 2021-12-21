//
//  ArtistListController.swift
//  CL5_Artistry
//
//  Created by 이건준 on 2021/12/14.
//

import UIKit
import Alamofire

class ArtistListController:UIViewController{
    
    //MARK: -Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        print("artist111 = \(Artist.getArtistFromBundle())")
    }
    
    //MARK: -Configure
    func configure(){
        view.backgroundColor = .systemBackground
    }
}
