//
//  MovieListController+UITableView.swift
//  MyMovieCollection
//
//  Created by 이건준 on 2022/02/12.
//

import UIKit

extension MovieListController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentMovieList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MovieListCell.identifier, for: indexPath) as? MovieListCell ?? MovieListCell()
        let currentMovie: MovieListModel  = currentMovieList[indexPath.row]
        cell.configureUI(currentMovie: currentMovie)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return selfView.screenView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return selfView.screenView
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let movieListModel: MovieListModel = currentMovieList[indexPath.row]
        coordinator?.cellTapped(movieListModel: movieListModel)
        print("tapped")
    }
}
