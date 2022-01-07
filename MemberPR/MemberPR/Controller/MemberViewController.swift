//
//  MemberViewController.swift
//  MemberPR
//
//  Created by 이건준 on 2022/01/07.
//

import UIKit
import RxSwift

class MemberViewController:UITableViewController{
    var members:[Member?] = []
    var disposeBag:DisposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNavigationBar()
        registerInTableView()
        setTableViewCell()
    }
    
    func registerInTableView(){
        tableView.register(MemberCell.self, forCellReuseIdentifier: "cell")
    }
    
    func setNavigationBar(){
        self.title = "Members"
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func setTableViewCell(){
        APIService.shared.getMember()
            .subscribe(onNext: { members in
                self.members = members
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            })
            .disposed(by: disposeBag)
    }
    
    func fetchImage(imageName:String?, completion: @escaping (UIImage?)->Void){
        DispatchQueue.global(qos: .default).async {
            if let imageName = imageName,
               let imageUrl = URL(string: imageName){
                let imageData = try! Data(contentsOf: imageUrl)
                let fetchImage = UIImage(data: imageData)
                DispatchQueue.main.async {
                    completion(fetchImage)
                }
            }
        }
    }
}

extension MemberViewController{
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return members.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? MemberCell ?? MemberCell()
        
        if let member = members[indexPath.row]{
            cell.textLabel?.text = member.name
            cell.detailTextLabel?.text = member.job
            fetchImage(imageName: member.avatar) { image in
                cell.imageView?.image = image
            }
        }
        return cell
    }
}
