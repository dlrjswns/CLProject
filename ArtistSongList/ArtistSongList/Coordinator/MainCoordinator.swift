//
//  MainCoordinator.swift
//  ArtistSongList
//
//  Created by 이건준 on 2022/02/06.
//

import UIKit

class MainCoordinator{
    func start(window: UIWindow, rootViewController: UIViewController){
        let rootViewController = UINavigationController(rootViewController: rootViewController)
        window.rootViewController = rootViewController
        window.makeKeyAndVisible()
    }
}
