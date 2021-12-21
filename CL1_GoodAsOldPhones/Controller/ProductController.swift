//
//  ProductController.swift
//  CL1_GoodAsOldPhones
//
//  Created by 이건준 on 2021/12/03.
//

import UIKit

class ProductController:UIViewController{
    let products:[Product] = [Product(title: "1907 Wall Set", smallImageName: "image-cell1@2x.png", bigImageName: "phone-fullscreen1@2x.png"), Product(title: "1921 Dial Phone", smallImageName: "image-cell2@2x.png", bigImageName: "phone-fullscreen2@2x.png"), Product(title: "1937 Desk Set", smallImageName: "image-cell3@2x.png", bigImageName: "phone-fullscreen3@2x.png"), Product(title: "1984 Moto Portable", smallImageName: "image-cell4@2x.png", bigImageName: "phone-fullscreen4@2x.png")]
    //테이블뷰에 이미지를 위한 배열
    
    final let tbHeight:CGFloat = 80
    //하드코딩방지를 위한 테이블뷰셀 높이
    
    private lazy var tbView:UITableView={
        let tb = UITableView()
//        tb.largeContentImage = UIImage(systemName: "person.fill")
        return tb
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemRed
        setTabBar()
        setView()
    }
    
    //MARK: -Configure
    func setTabBar(){ //ProductController가 담당하는 탭바세팅
        self.tabBarItem.title = "Products"
    }
    
    func setView(){ //루트뷰를 UITableView로 변환
        self.view = tbView
        tbView.dataSource = self
        tbView.delegate = self
        
        let guardView = UIView(frame: .zero) //테이블뷰 데이터존재하지않을때 가림막용
        tbView.tableFooterView = guardView
    }
}

extension ProductController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "cell")
        
        cell.textLabel?.text = products[indexPath.row].title
        cell.imageView?.image = UIImage(named: products[indexPath.row].smallImageName)
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tbHeight
    }
    
}
extension ProductController:UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailController()
        vc.product = products[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)//선택한 뷰에 해당하는 Model을 넘겨줌
    }
}
