//
//  MemberViewController.swift
//  MemberPR
//
//  Created by 이건준 on 2022/01/07.
//

import UIKit
import RxSwift
import RxCocoa

class MemberViewController:UITableViewController{
    var disposeBag:DisposeBag = DisposeBag()
    var memberViewModel = MemberViewModel(memberService: MemberServiceImpl(memberRepository: MemberRepositoryImpl()))
    
    private lazy var memberView:UITableView={
        let vw = UITableView()
        return vw
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewcontroller ang gimmofzzi")
        memberView.frame = UIScreen.main.bounds
        setNavigationBar()
        registerTableCell()
        setTableViewCell()
    }
    
    func registerTableCell(){
        memberView.register(MemberCell.self, forCellReuseIdentifier: "cell")
    }
    
    func setNavigationBar(){
        self.title = "Members"
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func setTableViewCell(){
//        APIService.shared.getMember()
//            .observe(on: MainScheduler.instance)
//            .subscribe(onNext: { members in
//                self.members = members
//                self.tableView.reloadData()
//            })
//            .disposed(by: disposeBag)
        print("엥")
        memberViewModel.memberRelay
            .observe(on: MainScheduler.instance)
            .bind(to: memberView.rx.items(cellIdentifier: "cell", cellType: MemberCell.self)){ index, item, cell in
                print("시발?")
                cell.textLabel?.text = item.name
                cell.detailTextLabel?.text = item.job
                cell.imageView?.image = item.avatar
                print("뭐냐 시발")
//                cell.nameLabel.text = item.name
//                cell.avatarImage.image = item.avatar
//                cell.jobLabel.text = item.job
            }
            .disposed(by: disposeBag)
        
    }
    
//    func fetchImage(imageName:String?, completion: @escaping (UIImage?)->Void){
//        DispatchQueue.global(qos: .default).async {
//            if let imageName = imageName,
//               let imageUrl = URL(string: imageName){
//                let imageData = try! Data(contentsOf: imageUrl)
//                let fetchImage = UIImage(data: imageData)
//                DispatchQueue.main.async {
//                    completion(fetchImage)
//                }
//            }
//        }
//    }
}

//extension MemberViewController{
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return members.count
//    }
//    
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? MemberCell ?? MemberCell()
//        
//        if let member = members[indexPath.row]{
//            cell.textLabel?.text = member.name
//            cell.detailTextLabel?.text = member.job
//            fetchImage(imageName: member.avatar) { image in
//                cell.imageView?.image = image
//            }
//        }
//        return cell
//    }
//}
