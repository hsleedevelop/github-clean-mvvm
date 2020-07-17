//
//  GithubService.swift
//  github-clean-mvvm
//
//  Created by HS Lee on 2020/07/15.
//  Copyright © 2020 HS Lee. All rights reserved.
//

import Foundation
import RxSwift

final class GithubService: NetworkService {
    typealias T = GithubAPI
    var baseURL: String

    init(config: AppConfiguration) {
        self.baseURL = config.apiBaseURL
    }
    
    func list() -> Observable<[GithubJob]> {
        return request(baseURL: self.baseURL, api: .list(0, 0))
            .map([JobElementDTO].self)
            .mapMany { $0.toDomain() }
    }
}
