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

final class MainViewCoordinator: BaseCoordinator<Void> {
    typealias ViewModelType = MainViewModel
    
    private let window: UIWindow
    private var viewController: MainViewController!
    
    init(window: UIWindow) {
        self.window = window
    }
    
    override func start() -> Observable<Void> {
        guard let viewController = UIStoryboard(name: "MainScene", bundle: Bundle.main).instantiateViewController(withIdentifier: "MainViewController") as? MainViewController else {
            fatalError("MainViewController can't load")
        }
        self.viewController = viewController
        
        let viewModel = ViewModelType()
        viewController.viewModel = viewModel

        let navigationController = UINavigationController(rootViewController: viewController)
        window.rootViewController = navigationController
        window.makeKeyAndVisible()

        return Observable.never()
    }
}
