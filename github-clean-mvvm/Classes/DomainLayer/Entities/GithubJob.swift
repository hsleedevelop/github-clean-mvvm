//
//  GithubJob.swift
//  github-clean-mvvm
//
//  Created by HS Lee on 2020/07/15.
//  Copyright © 2020 HS Lee. All rights reserved.
//

import Foundation

struct GithubJob: Equatable, Identifiable {
    typealias Identifier = String

    let id, type: String
    let url: String
    let createdAt, company: String
    let companyUrl: String?
    let location, title, jobDescription, howToApply: String
    let companyLogo: String
}
