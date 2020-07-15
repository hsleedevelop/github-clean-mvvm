//
//  JobsUseCaseAbstract.swift
//  github-clean-mvvm
//
//  Created by HS Lee on 2020/07/10.
//  Copyright © 2020 HS Lee. All rights reserved.
//

import Foundation
import RxSwift

// This is another option to create Use Case using more generic way
protocol JobsUseCaseAbstract {
    func lists(page: Int) -> Observable<[GithubJob]>
//    func save(post: Post) -> Observable<Void>
//    func delete(post: Post) -> Observable<Void>
}

//final class FetchJobsUseCase: UseCase {
//    private let requestValue: FetchJobsUseCaseRequestValue
//    private let githubRepository: GithubRepository
//
//    init(requestValue: FetchJobsUseCaseRequestValue, githubRepository: GithubRepository) {
//        self.githubRepository = githubRepository
//    }
//
//    func execute() {
//        githubRepository.fetchJobsUseCase(query: requestValue.query)
//    }
//}
//
//struct FetchJobsUseCaseRequestValue {
//    let query: GithubQuery
//    let page: Int
//}
