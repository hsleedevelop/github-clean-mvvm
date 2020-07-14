//
//  GithubRepository.swift
//  github-clean-mvvm
//
//  Created by HS Lee on 2020/07/14.
//  Copyright © 2020 HS Lee. All rights reserved.
//

import Foundation

protocol GithubRepository {
    func fetchFeedUseCase(query: GithubQuery)
}
