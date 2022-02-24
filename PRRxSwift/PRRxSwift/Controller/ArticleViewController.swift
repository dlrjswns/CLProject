////
////  ArticleViewController.swift
////  PRRxSwift
////
////  Created by 이건준 on 2022/01/27.
////
//
//import UIKit
//import RxSwift
//import RxRelay
//
//class ArticleViewController:UIViewController{
//    
//    //MARK: -Properties
//    let disposeBag:DisposeBag = DisposeBag()
//    let viewModel:RootViewModel
//    
//    private lazy var collectionView:UICollectionView={
//        let cv = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
//        
//        cv.delegate = self
//        cv.dataSource = self
//        
//        cv.backgroundColor = .systemBackground
//        return cv
//    }()
//    
//    private let articleViewModel = BehaviorRelay<[ArticleViewModel]>(value: [])
//    var articleViewModelObserver:Observable<[ArticleViewModel]>{
//        return articleViewModel.asObservable()
//    }
//    
//    //MARK: -Life Cycle
//    init(viewModel:RootViewModel){ //ArticleViewController는 이 viewModel에 관해서 관심사를 가지지않게 만들어준다, 단지 ArticleViewModel을 전달받을뿐
//        self.viewModel = viewModel
//        super.init(nibName: nil, bundle: nil)
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        configureUI()
//        configureCollectionView()
//        fetchArticles()
//        subscribe()
//    }
//    
//    //MARK: -Configure
//    func configureUI(){
//        view.backgroundColor = .systemBackground
//        
//        self.title = self.viewModel.title
//        
//        view.addSubview(collectionView)
//        collectionView.translatesAutoresizingMaskIntoConstraints = false
//        collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
//        collectionView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
//        collectionView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
//        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
//    }
//    
//    func configureCollectionView(){
//        self.collectionView.register(ArticleCell.self, forCellWithReuseIdentifier: "cell")
//    }
//    
//    //MARK: -Helper
//    func fetchArticles(){
//        viewModel.fetchArticles().subscribe(onNext:{ articleViewModels in
//            self.articleViewModel.accept(articleViewModels)
//        }).disposed(by: disposeBag)
//    }
//    
//    func subscribe(){
//        self.articleViewModelObserver.subscribe(onNext:{ articles in
//            DispatchQueue.main.async {
//                self.collectionView.reloadData()
//            }
//        }).disposed(by: disposeBag)
//    }
//}
//
//extension ArticleViewController:UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ArticleCell
//        
//        cell.imageView.image = nil
//        
//        let articleViewModel = self.articleViewModel.value[indexPath.row]
//        cell.viewModel.onNext(articleViewModel)
//        
//        return cell
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return self.articleViewModel.value.count
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: view.frame.width, height: 120)
//    }
//}
