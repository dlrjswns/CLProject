//
//  ArticleService.swift
//  PRRxSwift
//
//  Created by 이건준 on 2022/01/02.
//

import Foundation
import Alamofire
import RxSwift

class ArticleService{
    func fetchNews() -> Observable<[Article]>{
        return Observable.create { (observer) -> Disposable in
            self.fetchNews { error, articles in
                if let error = error{
                    observer.onError(error)
                }
                
                if let articles = articles{
                    observer.onNext(articles)
                }
                
                observer.onCompleted()
            }
            return Disposables.create()
        }
        
    }
    
    private func fetchNews(completion:@escaping (Error?, [Article]?)->()){
        let urlString = "https://newsapi.org/v2/everything?q=tesla&from=2021-12-02&sortBy=publishedAt&apiKey=bd7eb8f7f5154d409fd1ab4daeea0343"
        
        guard let url = URL(string: urlString) else {return completion(NSError(domain: "Leegunjun", code: 404, userInfo: nil), nil)}
        
        AF.request(url, method: HTTPMethod.get, parameters: nil, encoding: JSONEncoding.default, headers: nil, interceptor: nil, requestModifier: nil).responseDecodable(of: ArticleResponse.self){response in
            
            if let error = response.error{
                return completion(error, nil)
            }

            if let articles = response.value?.articles{
                return completion(nil, articles)
            }
//            switch response.result{
//            case .success(let articleResponse):
//                return completion(nil, articleResponse.articles)
//            case .failure(let error):
//                return completion(error, nil)
//            }
            
        
        }
    }
}
