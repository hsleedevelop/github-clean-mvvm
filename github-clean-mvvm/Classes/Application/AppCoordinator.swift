//
//  AppCoordinator.swift
//  github-clean-mvvm
//
//  Created by HS Lee on 2020/06/25.
//  Copyright © 2020 HS Lee. All rights reserved.
//

import UIKit
import RxSwift

class AppCoordinator: BaseCoordinator<Void> {

    private let window: UIWindow
    private let appDIContainer: AppDIContainer
    
    init(window: UIWindow, appDIContainer: AppDIContainer) {
        self.window = window
        self.appDIContainer = appDIContainer
    }

    override func start() -> Observable<Void> {
        let mainSceneDIContainer = appDIContainer.makeMainSceneDIContainer()
        let mainViewCoordinator = mainSceneDIContainer.makeMainViewCoordinator(window: window)
        return coordinate(to: mainViewCoordinator)
    }
}
