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

    init(window: UIWindow) {
        self.window = window
    }

    override func start() -> Observable<Void> {
        let mainViewCoordinator = MainViewCoordinator(window: window)
        return coordinate(to: mainViewCoordinator)
    }
}
