//
//  RSSReaderViewController.swift
//  CL8_SimpleRSSReader
//
//  Created by 이건준 on 2021/12/28.
//

import UIKit

private let reuseIdentifier = "cell"
class RSSReaderViewController:UITableViewController{
    //MARK: -Model
    var articles:[Article] = Article.getArticles()
    
    //MARK: -Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "News"
        tableView.register(RSSReaderViewCell.self, forCellReuseIdentifier: reuseIdentifier)
        
        tableView.estimatedRowHeight = 250
        tableView.rowHeight = UITableView.automaticDimension
       
//        tableView.estimatedRowHeight = 100
//        tableView.rowHeight = UITableView.automaticDimension
//        var parser: XMLParser
//        guard let url = URLComponents(string: "https://news.google.com/rss?hl=ko&gl=KR&ceid=KR:ko")?.url else { return }
//        parser = XMLParser(contentsOf: url)!
//        parser.delegate = self
//        parser.parse()

    }
}

extension RSSReaderViewController{
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! RSSReaderViewCell
        cell.title.text = articles[indexPath.row].title
        cell.descriptionLabel.text = articles[indexPath.row].description
        cell.pubDate.text = articles[indexPath.row].pubDate
        return cell
    }
    
//    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 250
//    }
//    
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! RSSReaderViewCell
        let isExpand = articles[indexPath.row].isExpand
        
        tableView.beginUpdates()
        cell.descriptionLabel.numberOfLines = isExpand ?3 :.max
        articles[indexPath.row].isExpand = !isExpand
        tableView.endUpdates()
//        tableView.reloadData()
    }
}

//extension RSSReaderViewController: XMLParserDelegate{
//    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
//        if elementName == "item"{
//
//        }
//    }
//
//    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
//        <#code#>
//    }
//
////    func parser(_ parser: XMLParser, foundCharacters string: String) {
////        <#code#>
////    }
//}
