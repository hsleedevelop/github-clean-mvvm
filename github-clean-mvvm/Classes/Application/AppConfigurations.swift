//
//  AppConfiguration.swift
//  ExampleMVVM
//
//  Created by Oleh Kudinov on 25.02.19.
//

import Foundation

final class AppConfiguration {
    
    lazy var apiKey: String = {
        return "Cucxa-WzacTQknrD5Ocu-RUARI4rMoDiUbag81fT88A"
    }()
    lazy var apiBaseURL: String = {
        return "https://jobs.github.com"
    }()
    lazy var imagesBaseURL: String = {
        guard let imageBaseURL = Bundle.main.object(forInfoDictionaryKey: "ImageBaseURL") as? String else {
            fatalError("ApiBaseURL must not be empty in plist")
        }
        return imageBaseURL
    }()
}
