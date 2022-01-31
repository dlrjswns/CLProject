//
//  StockListView.swift
//  StockTutorial
//
//  Created by 이건준 on 2022/02/01.
//

import UIKit

class StockListView:BaseView{
    let tableView:UITableView = {
       let view = UITableView()
        view.backgroundColor = .systemBackground
        return view
    }()
    
    override func configureUI() {
        addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
}
