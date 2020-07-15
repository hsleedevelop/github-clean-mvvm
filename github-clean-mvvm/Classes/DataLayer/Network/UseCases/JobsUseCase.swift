//
//  FetchJobsUseCase.swift
//  github-clean-mvvm
//
//  Created by HS Lee on 2020/07/15.
//  Copyright © 2020 HS Lee. All rights reserved.
//

import Foundation
import RxSwift

final class NetworkJobsUseCase: JobsUseCaseAbstract {

//    private let requestValue: FetchJobsUseCaseRequestValue
    private let repository: GithubRepository

//    init(requestValue: FetchJobsUseCaseRequestValue, githubRepository: GithubRepository) {
//        self.repository = githubRepository
//    }
    
    //init(repository: GithubRepository, cache: Cache) {
    init(repository: GithubRepository) {
        self.repository = repository
    }

    func lists(page: Int) -> Observable<[GithubJob]> {
        return repository.fetchJobsUseCase()
//        let fetchPosts = cache.fetchObjects().asObservable()
//        let stored = network.fetchPosts()
//            .flatMap {
//                return self.cache.save(objects: $0)
//                    .asObservable()
//                    .map(to: [Post].self)
//                    .concat(Observable.just($0))
//        }
//
//        return fetchPosts.concat(stored)
    }
}

struct FetchJobsUseCaseRequestValue {
    let query: GithubQuery
    let page: Int
}
