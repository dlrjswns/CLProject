//
//  MovieListViewModel.swift
//  MyMovieCollection
//
//  Created by 이건준 on 2022/02/10.
//

import Combine

class MovieListViewModel {
    @Published var movieListModel: [MovieListModel] = []
    @Published var errorMessage: String?
    @Published var isLoading: Bool = false
    
    var subscriber: Set<AnyCancellable> = .init()
    private let usecase: MovieListUsecase
    
    init(usecase: MovieListUsecase) {
        self.usecase = usecase
    }
    
    func searchQueryMovie(keyword: String) {
        isLoading = true
        usecase.fetchMovieListWithCombine(keyword: keyword).sink { [weak self] completion in
            self?.isLoading = false
            switch completion {
            case .failure(let error):
                self?.errorMessage = error.errorMessage
            case .finished: break
            }
        } receiveValue: { [weak self] movieList in
            print("movieList = \(movieList)")
            self?.movieListModel = self?.usecase.fetchMovieListModel(movies: movieList.items) ?? [MovieListModel]()
        }.store(in: &subscriber)
    }
}
