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
        var list: Driver<[GithubJob]>
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
        let jobList = self.fetchJobList(githubQuery: .init(query: "", page: 1), loadingType: .nextPage)
        
        return .init(list: jobList.asDriver(onErrorJustReturn: []),
                     isLoading: activity.asDriver(),
                     error: errorTracker.asDriver())
    }
    
    private func fetchJobList(githubQuery: GithubQuery, loadingType: JobsListViewModelLoading) -> Observable<[GithubJob]> {
        return jobUseCase.lists(page: githubQuery.page)
            .do(onNext: {
                print($0)
            })
            .trackError(errorTracker)
            .trackActivity(activity)
    }
}

enum JobsListViewModelLoading {
    case fullScreen
    case nextPage
}
