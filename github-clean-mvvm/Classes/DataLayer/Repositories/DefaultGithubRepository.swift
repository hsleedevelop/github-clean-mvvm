//
//  DefaultGithubRepository.swift
//  github-clean-mvvm
//
//  Created by HS Lee on 2020/07/14.
//  Copyright © 2020 HS Lee. All rights reserved.
//

import Foundation
import RxSwift

final class DefaultGithubRepository {
    typealias T = GithubAPI
    private let service: GithubService
    
    init(service: GithubService) {
        self.service = service
    }
}

extension DefaultGithubRepository: GithubRepository {
    //func fetchJobsUseCase(query: GithubQuery) -> Observable<[GithubJob]> {
    func fetchJobsUseCase() -> Observable<[GithubJob]> {
        return service.list()
    }
}
