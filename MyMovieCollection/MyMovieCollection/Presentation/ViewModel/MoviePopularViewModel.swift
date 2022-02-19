//
//  MoviePopularViewModel.swift
//  MyMovieCollection
//
//  Created by 이건준 on 2022/02/19.
//

import RxSwift
import RxRelay

class MoviePopularViewModel {
    
    private let usecase: MoviePopularUsecase
    var disposebag: DisposeBag = .init()
    
    let moviePopularModelRelay = BehaviorRelay<[MoviePopularModel]>(value: [])
    let errorMessage = BehaviorSubject<MovieError?>(value: nil)
    
    init(usecase: MoviePopularUsecase) {
        self.usecase = usecase
        
        _ = usecase.fetchMoviePopularWithRxSwift().subscribe(onNext: { [weak self] result in
            switch result {
            case .failure(let error):
                print("error = \(error)")
                self?.errorMessage.onNext(error)
            case .success(let popularMovieEntity):
                let moviePopularModels = usecase.fetchMoviePopularModel(popularMovies: popularMovieEntity.popularMovieList)
//                print("popularModels = \(moviePopularModels)")
                self?.moviePopularModelRelay.accept(moviePopularModels)
            }
        }).disposed(by: disposebag)
    }
    
    
}
