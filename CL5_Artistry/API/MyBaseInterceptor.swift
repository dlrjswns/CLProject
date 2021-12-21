//
//  BaseInterceptor.swift
//  CL5_Artistry
//
//  Created by 이건준 on 2021/12/14.
//

import Foundation
import Alamofire

final class MyBaseInterceptor:RequestInterceptor{
    func adapt(_ urlRequest: URLRequest, for session: Session, completion: @escaping (Result<URLRequest, Error>) -> Void) {
        
        print("MyBaseInterceptor - adapt() called")
        completion(.success(urlRequest))
    }
    
    func retry(_ request: Request, for session: Session, dueTo error: Error, completion: @escaping (RetryResult) -> Void) {
        
        print("MyBaseInterceptor - retry() called")
        completion(.doNotRetry) // API호출을 재시작하지않음
    }
}
