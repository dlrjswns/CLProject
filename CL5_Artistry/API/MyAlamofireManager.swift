//
//  AlamofireManager.swift
//  CL5_Artistry
//
//  Created by 이건준 on 2021/12/14.
//

import Foundation
import Alamofire

final class MyAlamofireManager{
    
    static let shared = MyAlamofireManager()
    
    let interceptors = Interceptor(interceptors: [MyBaseInterceptor()])
    
      let monitors = [MyLogger()] as [EventMonitor]
    
    let session : Session
    
    private init(){
        session = Session(interceptor:interceptors, eventMonitors: monitors)
    }
}
