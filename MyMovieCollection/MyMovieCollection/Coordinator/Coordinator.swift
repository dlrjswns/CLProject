//
//  Coordinator.swift
//  MyMovieCollection
//
//  Created by 이건준 on 2022/02/10.
//

import UIKit

enum Event {
    case tableCellTapped
    case collectionCellTapped
}

protocol Coordinator {
    associatedtype T
    var navigationController: UINavigationController? { get set }
    
    func cellTapped(with model: T)
    
    func start()
}

//protocol Coordinating {
//    associatedtype Model
//    var coordinator: Coordinator? { get set }
//}
