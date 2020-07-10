//
//  DIContainer.swift
//  ExampleMVVM
//
//  Created by Oleh Kudinov on 01.10.18.
//

import Foundation

class GithubAPIService: APIService {
    
}

final class AppDIContainer {
    
    lazy var appConfiguration = AppConfiguration()
    
//    lazy var apiService: APIService {
//        let config = ApiDataNetworkConfig(baseURL: URL(string: appConfiguration.apiBaseURL))
//        let apiService =
//
//        return APIService()
//    }
    
    func makeMainSceneDIContainer() -> MainSceneDIContainer {
        let dependencies = MainSceneDIContainer.Dependencies(apiService: GithubAPIService())
        return .init(dependencies: dependencies)
    }
    
//    // MARK: - Network
//    lazy var apiDataTransferService: DataTransferService = {
//        let config = ApiDataNetworkConfig(baseURL: URL(string: appConfiguration.apiBaseURL)!,
//                                          queryParameters: ["api_key": appConfiguration.apiKey,
//                                                            "language": NSLocale.preferredLanguages.first ?? "en"])
//
//        let apiDataNetwork = DefaultNetworkService(config: config)
//        return DefaultDataTransferService(with: apiDataNetwork)
//    }()
//    lazy var imageDataTransferService: DataTransferService = {
//        let config = ApiDataNetworkConfig(baseURL: URL(string: appConfiguration.imagesBaseURL)!)
//        let imagesDataNetwork = DefaultNetworkService(config: config)
//        return DefaultDataTransferService(with: imagesDataNetwork)
//    }()
//
//    // MARK: - DIContainers of scenes
//    func makeMoviesSceneDIContainer() -> MoviesSceneDIContainer {
//        let dependencies = MoviesSceneDIContainer.Dependencies(apiDataTransferService: apiDataTransferService,
//                                                               imageDataTransferService: imageDataTransferService)
//        return MoviesSceneDIContainer(dependencies: dependencies)
//    }
}
