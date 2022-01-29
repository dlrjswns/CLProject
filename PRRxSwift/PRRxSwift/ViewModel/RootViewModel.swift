//
//  RootViewModel.swift
//  PRRxSwift
//
//  Created by 이건준 on 2022/01/27.
//

import Foundation
import RxSwift

final class RootViewModel{
    let title = "Gunjun News"
    
    private let articleService:ArticleServiceProtocol //RootViewModel에서 사용할 articleService에서 타입을 ArticleService로 바로 지정하거나 혹은 ArticleService()로 하지않고 프로토콜타입을 지정해준 이유는 확장성때문이다, 그 이유는 예를 들어서 우리가 실제로 서버통신하는 코드를 만들게아니라 stubArticleService를 사용할 수도 있다(단순히 돌아가나? 가짜코드를 이용하여 test를 할때, 여러개의 dummy클래스가 필요할수도 있다)
    
    init(articleService:ArticleServiceProtocol){
        self.articleService = articleService
    }
    
    func fetchArticles()->Observable<[ArticleViewModel]>{
        articleService.fetchNews().map{ $0.map{ ArticleViewModel(article: $0) } }
    }
}
