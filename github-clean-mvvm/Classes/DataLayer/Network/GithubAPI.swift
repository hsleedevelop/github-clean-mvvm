//
//  GithubAPI.swift
//  github-clean-mvvm
//
//  Created by HS Lee on 2020/07/10.
//  Copyright © 2020 HS Lee. All rights reserved.
//

import Foundation

protocol API {
    var url: String { get }
}

enum GithubAPI: API {
    
    ///포토 리스트
    case list(Int, Int)
    ///검색
    case search(Int, Int, String)
    
    private var path: String {
        switch self {
        case let .list(page, pageSize):
            return "/photos?page=\(page)&per_page=\(pageSize)"
        case let .search(page, pageSize, keyword):
            return "/search/photos?query=\(keyword)&page=\(page)"
        }
    }
    
    var method: String {
        switch self {
        default:
            return "GET"
        }
    }
    
    var url: String {
        return self.path
    }
}
