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
        
        let serialQueue = DispatchQueue(label: "gunjun")
        
        serialQueue.async {
            for a in 1...5 {
                print("Serial Queue async = \(a)")
            }
        }
        
        serialQueue.async {
            for a in 9...10 {
                print("Serial Queue async2 = \(a)")
            }
        }
        
        DispatchQueue.global().async {
            for a in 6...8 {
                print("Concurrent Queue async = \(a)")
            }
            print("i'm a serious")
        }
        
        DispatchQueue.global().async {
            for a in 11...16 {
                print("Concurrent Queue async = \(a)")
            }
            print("who are you")
        }
       
        
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

