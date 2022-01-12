//
//  API.swift
//  OrderList
//
//  Created by 이건준 on 2022/01/09.
//

import Foundation
import Alamofire
import RxSwift

//Repository
class API{
//    func getOrderListOb()->Observable<[Menu]>{
//        return Observable.create { [weak self] stream in
//            self?.getOrderListAF { error, menus in
//                if let error = error{
//                    stream.onError(error)
//                }
//
//                if let menus = menus{
//                    stream.onNext(menus)
//                }
//
//                stream.onCompleted()
//            }
//            return Disposables.create()
//        }
//    }
    
    func getOrderListAF(completion: @escaping (Error?, [Menu]?)->Void){
        guard let url = URL(string: "https://firebasestorage.googleapis.com/v0/b/rxswiftin4hours.appspot.com/o/fried_menus.json?alt=media&token=42d5cb7e-8ec4-48f9-bf39-3049e796c936") else {return}
        
        AF.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil, interceptor: nil, requestModifier: nil).responseDecodable(of: Menus.self) { response in
            if let error = response.error{
                completion(error, nil)
            }
            
            if let data = response.value?.menus{
                completion(nil, data)
            }
        }
    }
}
