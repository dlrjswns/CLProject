//
//  BeerRepository.swift
//  CL_BringBeer
//
//  Created by 이건준 on 2022/01/19.
//

import Foundation
import RxSwift
import RxCocoa

class BeerRepositoryImpl:BeerRepository{
    private let session:URLSession
    
    init(session:URLSession = .shared){
        self.session = session
    }
    
    func getBeers(url:String)->Observable<Result<[Beer], BeerError>>{
        guard let url = URL(string: url) else {return .just(.failure(.customError("Url이 올바르지 않습니다")))}
        return session.rx.data(request: URLRequest(url: url))
            .map { data in
                do{
                    let beers = try JSONDecoder().decode([Beer].self, from: data)
                    print("getbeers")
                    return .success(beers)
                }catch{
                    print("실패")
                    return .failure(.customError("Decode failed"))
                }
            }
//        session.dataTask(with: url) { data, response, error in
//            if let error = error{
//
//            }
//
//            if let data = data{
//                try JSONSerialization.jsonObject(with: data, options: .allowFragments)
//            }
//        }
    }
}
