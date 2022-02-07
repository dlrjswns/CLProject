//
//  ArtistListController.swift
//  ArtistSongList
//
//  Created by 이건준 on 2022/02/06.
//

import UIKit

class ArtistListController: BaseViewController{
    
    let artistListView = ArtistListView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func configureUI() {
        view.addSubview(artistListView)
        artistListView.translatesAutoresizingMaskIntoConstraints = false
        artistListView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        artistListView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        artistListView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        artistListView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
}

