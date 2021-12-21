//
//  MyLogger.swift
//  CL5_Artistry
//
//  Created by 이건준 on 2021/12/14.
//

import Foundation
import Alamofire

final class MyLogger:EventMonitor{
    func requestDidResume(_ request: Request) {
        print("MyLogger - requestDidResume() called") // Logging
    }
    
    func request(_ request: DataRequest, didParseResponse response: DataResponse<Data?, AFError>) {
        print("MyLogger - didParseResponse() called") // Logging
    }
}
