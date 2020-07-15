//
//  MainViewCoordinator.swift
//  github-clean-mvvm
//
//  Created by HS Lee on 2020/07/10.
//  Copyright © 2020 HS Lee. All rights reserved.
//

import UIKit
import RxSwift
import RxSwiftExt

protocol MainViewCoordinatorDependencies {
    func makeMainViewController(coordinator: MainViewCoordinator) -> MainViewController
    
    //func makeMovieDetailsViewController(movie: Movie) -> MovieDetailsViewController
}


final class MainViewCoordinator: BaseCoordinator<Void> {
    typealias ViewModelType = MainViewModel
    
    private let window: UIWindow
    private let dependencies: MainViewCoordinatorDependencies

    //private var viewController: MainViewController!
    init(window: UIWindow, dependencies: MainViewCoordinatorDependencies) {
        self.window = window
        self.dependencies = dependencies
    }
    
    override func start() -> Observable<Void> {
        let viewController = dependencies.makeMainViewController(coordinator: self)
        let navigationController = UINavigationController(rootViewController: viewController)
        window.rootViewController = navigationController
        window.makeKeyAndVisible()

        return Observable.never()
    }
}
