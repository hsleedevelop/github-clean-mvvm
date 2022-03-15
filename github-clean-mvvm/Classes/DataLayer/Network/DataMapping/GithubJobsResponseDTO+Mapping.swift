//
//  GithubJobsResponseDTO+Mapping.swift
//  github-clean-mvvm
//
//  Created by HS Lee on 2020/07/14.
//  Copyright © 2020 HS Lee. All rights reserved.
//

import Foundation
import Domain
// MARK: - Data Transfer Object

typealias JobResponseDTO = [JobElementDTO]

struct JobElementDTO: Codable {
    let id, type: String
    let url: String
    let createdAt, company: String
    let companyUrl: String?
    let location, title, jobDescription: String
    let howToApply: String?
    let companyLogo: String?

    enum CodingKeys: String, CodingKey {
        case id, type, url
        case createdAt = "created_at"
        case company
        case companyUrl = "company_url"
        case location, title
        case jobDescription = "description"
        case howToApply = "how_to_apply"
        case companyLogo = "company_logo"
    }
}


// MARK: - Mappings to Domain

extension JobElementDTO {
    func toDomain() -> GithubJob {
        return .init(id: id,
                     type: type,
                     url: url,
                     createdAt: createdAt,
                     company: company,
                     companyUrl: companyUrl,
                     location: location,
                     title: title,
                     jobDescription: jobDescription,
                     howToApply: howToApply,
                     companyLogo: companyLogo)
    }
}

//// MARK: - Private\
//private let dateFormatter: DateFormatter = {
//    let formatter = DateFormatter()
//    formatter.dateFormat = "yyyy-MM-dd"
//    formatter.calendar = Calendar(identifier: .iso8601)
//    formatter.timeZone = TimeZone(secondsFromGMT: 0)
//    formatter.locale = Locale(identifier: "en_US_POSIX")
//    return formatter
//}()
