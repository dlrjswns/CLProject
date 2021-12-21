//
//  TodoListController.swift
//  CL4_ToDoTDD
//
//  Created by 이건준 on 2021/12/12.
//

import UIKit

class TodoListController:UIViewController{
    //MARK: Model
    var memoArray:[Memo] = []
    
    //MARK: -UI Component
    private lazy var tbView:UITableView={
        let vw = UITableView()
        vw.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
        vw.heightAnchor.constraint(equalToConstant: view.frame.height).isActive = true
        return vw
    }()
    
    private lazy var rightButtonItem:UIBarButtonItem={
        let btn = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.add
                                  , target: self, action: #selector(tapBarButton))
        return btn
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        print("sdfsadfsafas")
        self.tbView.reloadData()
        for a in memoArray{
            print("title = \(a.title), address = \(a.comment), date = \(a.date)")
        }
    }
    
    //MARK: -Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        setNavigationBar()
        setTableView()
    }
    
    //MARK: -Objc
    @objc func tapBarButton(){
        print("tapBarButton() Tapped")
        let vc = AddMemoController()
        vc.delegate = self
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    //MARK: -For Setting
    func setNavigationBar(){
        self.navigationItem.rightBarButtonItem = rightButtonItem
    }
    
    func setTableView(){
        self.tbView.dataSource = self
    }
    
    //MARK: -Configure
    func configure(){
        view.backgroundColor = .systemBackground
        
        view.addSubview(tbView)
        tbView.translatesAutoresizingMaskIntoConstraints = false
        tbView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        tbView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tbView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
    }
}

//MARK: -UITableViewDataSource
extension TodoListController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memoArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: "cell")
        cell.textLabel?.text = memoArray[indexPath.row].title
        cell.detailTextLabel?.text = memoArray[indexPath.row].comment
        return cell
    }
}

extension TodoListController:SaveDataDelegate{
    func saveData(data saveData: Memo) {
        memoArray.append(saveData)
        print("saveData() - called")
        for a in memoArray {
            print("memoArray - \(a)")
        }
    }
    
    
}
