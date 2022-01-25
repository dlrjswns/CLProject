//
//  BeerService.swift
//  CL_BringBeer
//
//  Created by 이건준 on 2022/01/22.
//

import Foundation
import RxSwift

class BeerService{
    let beerRepositoryImpl = BeerRepositoryImpl()
    
    func getBeers()->Observable<Result<[Beer], BeerError>>{
//        var beerModels:[BeerModel] = []
//        beerRepositoryImpl.getBeers(url: "https://api.punkapi.com/v2/beers")
//            .map { result in
//                switch result{
//                case .success(let beers):
//                    beers.map { beer in
//                       let beerModel = BeerModel(id: beer.id, name: beer.name, description: beer.description, imageURL: beer.imageURL)
//                        beerModels.append(beerModel)
//                    }
//                case .failure(let beerError):
//                    print("BeerService selectAll() - \(beerError.errorMessage)")
//                }
//            }
//    }
        return beerRepositoryImpl.getBeers(url: "https://api.punkapi.com/v2/beers")
}
    func parseBeersToBeerModel(beers:[Beer])->[BeerModel]{
        var beerModels:[BeerModel] = []
        beers.map { beer in
            let beerModel = BeerModel(id: beer.id ?? 0, name: beer.name ?? "", description: beer.description ?? "", imageURL: beer.imageURL ?? "")
            beerModels.append(beerModel)
        }
        return beerModels
    }
    
    func fetchImageURL(imageUrl:String?)->UIImage?{
        guard let imageUrl = imageUrl,
              let url = URL(string: imageUrl) else {return nil}
        let data = try? Data(contentsOf: url)
        return UIImage(data: data ?? Data())
    }
}
