//
//  GithubRepository.swift
//  github-clean-mvvm
//
//  Created by HS Lee on 2020/07/14.
//  Copyright © 2020 HS Lee. All rights reserved.
//

import Foundation
import RxSwift

protocol GithubRepository {
    func fetchJobsUseCase() -> Observable<[GithubJob]>
}
