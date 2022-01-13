//
//  APIService.swift
//  MemberPR
//
//  Created by 이건준 on 2022/01/07.
//

import UIKit
import Alamofire
import RxSwift

//Repository
class APIRepository{
//    static let shared = APIService()
    
    func getMember(completion: @escaping ([Member])->Void){
        getMember { error, members in
            guard let members = members,
                  error == nil else { return }
//            print("members = \(members)")
            completion(members)
        }
    }
    
//    func getMember()->Observable<[Member?]>{
//        return Observable.create { stream in
//            self.getMember { error, members in
//                if let error = error{
//                    stream.onError(error)
//                }
//
//                if let members = members{
//                    stream.onNext(members)
//                }
//                stream.onCompleted()
//            }
//            return Disposables.create()
//        }
//    }
    
    private func getMember(completion: @escaping (Error?, [Member]?)->Void){
        let BASE_URL = "https://my.api.mockaroo.com/members_with_avatar.json?key=44ce18f0"
        guard let url = URL(string: BASE_URL) else { return }
        
        AF.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil, interceptor: nil, requestModifier: nil).responseDecodable(of: [Member].self) { response in
            if let error = response.error{
                completion(error, nil)
            }
            
            if let data = response.value{
                completion(nil, data)
            }
        }
    }
}
