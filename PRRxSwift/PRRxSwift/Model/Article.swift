//
//  Article.swift
//  PRRxSwift
//
//  Created by 이건준 on 2022/01/02.
//

import Foundation

struct ArticleResponse:Codable{
    let status:String?
    let totalResults:Int
    let articles:[Article]
}

struct Article:Codable{
    let auth:String?
    let title:String?
    let description:String?
    let url:String?
    let urlToImage:String?
    let publishedAt:String?
}
