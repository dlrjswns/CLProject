//
//  ArticleViewController.swift
//  PRRxSwift
//
//  Created by 이건준 on 2022/01/27.
//

import UIKit
import RxSwift
import RxRelay

class ArticleViewController:UIViewController{
    
    //MARK: -Properties
    let disposeBag:DisposeBag = DisposeBag()
    
    let viewModel:ArticleViewModel
    
    private let articles = BehaviorRelay<[Article]>(value: [])
    
    var articlesObserver:Observable<[Article]>{ //articles를 지켜보고있는 Property
        return articles.asObservable()
    }
    
    //MARK: -Life Cycle
    init(viewModel:ArticleViewModel){ //ArticleViewController는 이 viewModel에 관해서 관심사를 가지지않게 만들어준다, 단지 ArticleViewModel을 전달받을뿐
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        fetchArticles()
        subscribe()
    }
    
    //MARK: -Configure
    func configureUI(){
        view.backgroundColor = .systemBackground
    }
    
    //MARK: -Helper
    func fetchArticles(){
        self.viewModel.fetchArticles().subscribe(onNext:{ articles in
            self.articles.accept(articles)
        })
        .disposed(by: disposeBag)
    }
    
    func subscribe(){
        self.articlesObserver.subscribe(onNext:{ articles in
            articles
        })
        .disposed(by: disposeBag)
    }
}
