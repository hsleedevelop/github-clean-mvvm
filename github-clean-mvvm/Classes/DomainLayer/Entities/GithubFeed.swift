//
//  GithubFeed.swift
//  github-clean-mvvm
//
//  Created by HS Lee on 2020/07/14.
//  Copyright © 2020 HS Lee. All rights reserved.
//

import Foundation

struct GithubFeed: Equatable, Identifiable {
    typealias Identifier = String
    enum Genre {
        case adventure
        case scienceFiction
    }
    let id: Identifier
    let title: String?
    let genre: Genre?
    let posterPath: String?
    let overview: String?
    let releaseDate: Date?
}

struct GithubFeedsPage: Equatable {
    let page: Int
    let totalPages: Int
    let feeds: [GithubFeed]
}
