//
//  BeerViewModel.swift
//  CL_BringBeer
//
//  Created by 이건준 on 2022/01/22.
//

import RxSwift
import RxRelay
import RxCocoa

class BeerViewModel{
    let beerService = BeerService()
    let beerRelay = BehaviorRelay<[BeerModel]>(value: [])
    let disposeBag = DisposeBag()
    
    init(){
        beerService.getBeers()
            .subscribe(onNext: { result in
                switch result{
                case .success(let beers):
                    self.beerRelay.accept(self.beerService.parseBeersToBeerModel(beers: beers))
                case .failure(let err):
                    print(err.errorMessage)
                }
            })
            .disposed(by: disposeBag)
    }
    
    func fetchImageURL(imageUrl:String?)->UIImage?{
        return beerService.fetchImageURL(imageUrl: imageUrl)
    }
    
}
