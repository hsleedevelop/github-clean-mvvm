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
//        var search: Observable<(String, Int)>
//        var photoPressed: Observable<Int>
    }
    
    struct Output {
        //        var list: Driver<[String]>
        //        var currentIndex: Driver<Int>
        var isLoading: Driver<Bool>
        var error: Driver<Error>
    }
}

final class MainViewModel: ViewModelType {

    private let jobUseCase: JobsUseCaseAbstract
    private let coordinator: MainViewCoordinator
    //private let closures: MoviesListViewModelClosures?
    
    private let activity = ActivityIndicator()
    private let errorTracker = ErrorTracker()

    var currentPage: Int = 0
    var totalPageCount: Int = 1
    var hasMorePages: Bool { currentPage < totalPageCount }
    var nextPage: Int { hasMorePages ? currentPage + 1 : currentPage }
    
    // MARK: - OUTPUT
    var loadingType: Observable<JobsListViewModelLoading?>?
    
    // MARK: - Init

    init(jobUseCase: JobsUseCaseAbstract, coordinator: MainViewCoordinator) {
        self.jobUseCase = jobUseCase
        self.coordinator = coordinator
    }
    
    func transform(input: Input) -> Output {
        
        
        let jobs = self.load(githubQuery: .init(query: "", page: 1), loadingType: .nextPage)
        
        return .init(isLoading: activity.asDriver(),
                     error: errorTracker.asDriver())
    }
    
    private func load(githubQuery: GithubQuery, loadingType: JobsListViewModelLoading) -> Observable<[GithubJob]> {
        return jobUseCase.lists(page: githubQuery.page)
            .trackError(errorTracker)
            .trackActivity(activity)
//        self.loadingType.value = loadingType
//        query.value = githubQuery.query
//
//        fetchJobsUseCase.execute()
        
        
        
        //moviesLoadTask = fetchJobsUseCase.execute(
//        moviesLoadTask = fetchJobsUseCase.execute(
//            requestValue: .init(query: movieQuery, page: nextPage),
//            cached: appendPage,
//            completion: { result in
//                switch result {
//                case .success(let page):
//                    self.appendPage(page)
//                case .failure(let error):
//                    self.handle(error: error)
//                }
//                self.loadingType.value = .none
//        })
    }
}

enum JobsListViewModelLoading {
    case fullScreen
    case nextPage
}
