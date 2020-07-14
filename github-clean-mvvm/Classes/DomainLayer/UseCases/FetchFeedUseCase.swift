//
//  FetchFeedUseCase.swift
//  github-clean-mvvm
//
//  Created by HS Lee on 2020/07/10.
//  Copyright © 2020 HS Lee. All rights reserved.
//

import Foundation


// This is another option to create Use Case using more generic way
final class FetchFeedUseCase: UseCase {
    
//    struct RequestValue {
//        let maxCount: Int
//    }
//    typealias ResultValue = (Result<[MovieQuery], Error>)
//
//    private let requestValue: RequestValue
//    private let completion: (ResultValue) -> Void
//    private let moviesQueriesRepository: MoviesQueriesRepository
//
//    init(requestValue: RequestValue,
//         completion: @escaping (ResultValue) -> Void,
//         moviesQueriesRepository: MoviesQueriesRepository) {
//
//        self.requestValue = requestValue
//        self.completion = completion
//        self.moviesQueriesRepository = moviesQueriesRepository
//    }
    init(githubRepository: GithubRepository) {
        self.githubRepository = githubRepository
    }
    private let githubRepository: GithubRepository
    
    func execute() {
        githubRepository.fetchFeedUseCase()
    }
//    func start() -> Cancellable? {
//
////        moviesQueriesRepository.fetchRecentsQueries(maxCount: requestValue.maxCount, completion: completion)
//        return nil
//    }
}
