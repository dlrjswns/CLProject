//
//  StockListView.swift
//  StockTutorial
//
//  Created by 이건준 on 2022/02/01.
//

import UIKit

class StockListView:BaseView{
    typealias Data = (symbol:String, name:String, type:String, currency:String)
    
    let tableView:UITableView = {
       let view = UITableView()
        view.backgroundColor = .systemBackground
        return view
    }()
    
    let searchViewController:UISearchController = {
       let view = UISearchController(searchResultsController: nil)
        view.searchBar.placeholder = "Enter a company name or symbol"
        view.obscuresBackgroundDuringPresentation = false
        return view
    }()
    
    let loadingView = LoadingView()
    
    override func configureUI() {
        addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        tableView.register(StockCell.self, forCellReuseIdentifier: StockCell.identifier)
        tableView.separatorStyle = .none
        
        addSubview(loadingView)
        loadingView.translatesAutoresizingMaskIntoConstraints = false
        loadingView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        loadingView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        loadingView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        loadingView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
}
