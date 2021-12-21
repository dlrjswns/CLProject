//
//  MainSearchViewController.swift
//  CL6_CandySearch
//
//  Created by 이건준 on 2021/12/18.
//

import UIKit

private let reuseIdentifier = "cell"
class MainSearchViewController:UITableViewController{
    //MARK: -Property
    let candies:[Candy] = ForCandy.getCandies() // Get candy at Model
    var filteredCandies:[Candy] = []
    let scopeButtons:[String] = ["All", "Chocolate", "Hard", "Other"]
    var isFiltering: Bool{
        let active = searchbarController.isActive //searchController에 searchBar를 클릭할때 true, 아니면 false
        let isEmpty = searchbarController.searchBar.text?.isEmpty ?? false
        return active && !isEmpty
    }
    
    private lazy var searchbarController:UISearchController = {
       let sb = UISearchController(searchResultsController: nil)
        sb.searchBar.scopeButtonTitles = scopeButtons
//        sb.searchBar.showsScopeBar = false
        sb.searchResultsUpdater = self //UISearchbar에 입력한 텍스트를 자신한테 위임
        sb.obscuresBackgroundDuringPresentation = false
        sb.searchBar.delegate = self
        return sb
    }()
    
    //MARK: -Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        setNavigationBar()
    }
    
    func scopeButtonToggle(){
        if searchbarController.isActive{
            searchbarController.searchBar.showsScopeBar = true
        }else if !searchbarController.isActive{
            searchbarController.searchBar.showsScopeBar = false
        }
    }
    
    //MARK: -Set navigationBar
    func setNavigationBar(){ //이 부분을 proxy로 뺄지, 추후에 변경사항
        self.navigationItem.titleView = UIImageView(image: UIImage(named: "candyLogo.png"))
        
        self.navigationItem.searchController = searchbarController
        self.navigationItem.hidesSearchBarWhenScrolling = false
    }
    
    //MARK: -Helper
    func filteredWhenScopeButtonTapped(_ searchText: String, scope: String = "All") {
          filteredCandies = candies.filter { candy in
            if !(candy.candyType == scope) && scope != "All" {
                  return false
              }
              
            return candy.candyName.lowercased().contains(searchText.lowercased()) || searchText == ""
          }
          print("filteredCandies = \(filteredCandies)")
          tableView.reloadData()
    }
    //MARK: -Configure
    func configure(){
        view.backgroundColor = .systemBackground
    }
}

//MARK: -UITableViewDataSource
extension MainSearchViewController{
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if !searchbarController.isActive{
            print("call !isFiltering")
            return candies.count
        }
        else{
            print("call isFiltering")
            return filteredCandies.count
        }
        }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: reuseIdentifier)
        cell.accessoryType = .disclosureIndicator
        if !searchbarController.isActive{
        cell.textLabel?.text = candies[indexPath.row].candyName
        cell.detailTextLabel?.text = candies[indexPath.row].candyType
        }else{
            cell.textLabel?.text = filteredCandies[indexPath.row].candyName
            cell.detailTextLabel?.text = filteredCandies[indexPath.row].candyType
        }
        return cell
    }
}

//MARK: -UITableViewDelegate
extension MainSearchViewController{
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        guard let cell = tableView.cellForRow(at: indexPath) else { return }
        let vc = DetailSearchController()
        vc.candy = candies[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

//MARK: -UISearchResultsUpdating
extension MainSearchViewController:UISearchResultsUpdating{
    func updateSearchResults(for searchController: UISearchController) {
        guard let searchbarText = searchController.searchBar.text else { return }
//        print("searchbarText = \(searchbarText)")
//        filteredCandies = candies.filter({ candy in
//            candy.candyName.lowercased().contains(searchbarText)
//        })
        let scope = searchController.searchBar.scopeButtonTitles![searchController.searchBar.selectedScopeButtonIndex]
        filteredWhenScopeButtonTapped(searchbarText, scope: scope)
//        print("filteredCandies = \(filteredCandies)")
    }
}

//MARK: -UISearchBarDelegate
extension MainSearchViewController:UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        print(selectedScope)
        filteredWhenScopeButtonTapped(searchBar.text!, scope: scopeButtons[selectedScope])
    }
}
