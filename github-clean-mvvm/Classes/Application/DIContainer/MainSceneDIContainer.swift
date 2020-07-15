//
//  MainSceneDIContainer.swift
//  github-clean-mvvm
//
//  Created by HS Lee on 2020/07/10.
//  Copyright © 2020 HS Lee. All rights reserved.
//

import UIKit

protocol APIService {
    
}

final class MainSceneDIContainer {
    struct Dependencies {
        let apiProvider: GithubProvider
    }
    
    private let dependencies: Dependencies
    
    init(dependencies: Dependencies) {
        self.dependencies = dependencies
    }
    
    // MARK: - Flow Coordinators
    func makeMainViewCoordinator(window: UIWindow) -> MainViewCoordinator {
        let mainViewCoordinator = MainViewCoordinator(window: window, dependencies: self)
        return mainViewCoordinator
    }
    
    func makeMainViewController(coordinator: MainViewCoordinator) -> MainViewController {
        MainViewController.create(with: makeMainViewModel(coordinator: coordinator))
    }
    
    func makeMainViewModel(coordinator: MainViewCoordinator) -> MainViewModel {
        return .init(jobUseCase: makeJobsUseCase(), coordinator: coordinator)
    }
    
    // MARK: - Use Cases
    func makeJobsUseCase() -> JobsUseCaseAbstract {
        return NetworkJobsUseCase(repository: makeGithbuRepository())
    }
    
    // MARK: - Repositories
    func makeGithbuRepository() -> GithubRepository {
        return DefaultGithubRepository(service: dependencies.apiProvider)
    }
}

extension MainSceneDIContainer: MainViewCoordinatorDependencies {
}
