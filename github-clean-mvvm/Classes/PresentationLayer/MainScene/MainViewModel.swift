//
//  MainViewModel.swift
//  github-clean-mvvm
//
//  Created by HS Lee on 2020/07/10.
//  Copyright © 2020 HS Lee. All rights reserved.
//

import Foundation

import RxSwift
import RxCocoa
import RxSwiftExt

extension MainViewModel {
    struct Input {
        var fetchList: Observable<Void>
        var search: Observable<(String, Int)>
        var photoPressed: Observable<Int>
    }
    
    struct Output {
        //        var list: Driver<[String]>
        //        var currentIndex: Driver<Int>
        var isLoading: Driver<Bool>
        var error: Driver<Error>
    }
}

final class MainViewModel: ViewModelType {

    private let fetchFeedUseCase: FetchFeedUseCase
    //private let closures: MoviesListViewModelClosures?

    var currentPage: Int = 0
    var totalPageCount: Int = 1
    var hasMorePages: Bool { currentPage < totalPageCount }
    var nextPage: Int { hasMorePages ? currentPage + 1 : currentPage }
    
    // MARK: - Init

    init(fetchFeedUseCase: FetchFeedUseCase) {
        self.fetchFeedUseCase = fetchFeedUseCase
    }
    
    func transform(input: Input) -> Output {
        let activity = ActivityIndicator()
        let errorTracker = ErrorTracker()
        
        return .init(isLoading: activity.asDriver(),
                     error: errorTracker.asDriver())
    }
    
    private func load(movieQuery: MovieQuery, loadingType: MoviesListViewModelLoading) {
        self.loadingType.value = loadingType
        query.value = movieQuery.query

        fetchFeedUseCase.execute()
        moviesLoadTask = searchMoviesUseCase.execute(
            requestValue: .init(query: movieQuery, page: nextPage),
            cached: appendPage,
            completion: { result in
                switch result {
                case .success(let page):
                    self.appendPage(page)
                case .failure(let error):
                    self.handle(error: error)
                }
                self.loadingType.value = .none
        })
    }
}
