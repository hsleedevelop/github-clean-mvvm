//
//  MainViewController.swift
//  github-clean-mvvm
//
//  Created by HS Lee on 2020/07/10.
//  Copyright © 2020 HS Lee. All rights reserved.
//

import Foundation
import UIKit

import RxSwift
import RxCocoa
import RxSwiftExt

class MainViewController: UIViewController {
    typealias ViewModelType = MainViewModel
    
    // MARK: - * properties --------------------
    var viewModel: ViewModelType!
    private var disposeBag = DisposeBag()

    // MARK: - * IBOutlets --------------------
    @IBOutlet weak var tableView: UITableView!

    // MARK: - * Initialize --------------------

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.initUI()
        
        bindViewModel()
    }


    private func initUI() {

    }

    // MARK: - * Main Logic --------------------
    private func bindViewModel() {
//        let input = IntroViewModel.Input(launching: viewDidLoadRelay.asObservable())
//        let output = viewModel.transform(input: input)
//
//        output.accessToken
//            .map { _ in (FlowCoordinator.Step.main, nil, self.view.window) }
//            .drive(FlowCoordinator.shared.rx.flow)
//            .disposed(by: disposeBag)
//
//        output.error
//            .do(onNext: { error in
//                print(error.localizedDescription)
//            })
//            .map { _ in (FlowCoordinator.Step.authentication, nil, self.view.window) }
//            .drive(FlowCoordinator.shared.rx.flow)
//            .disposed(by: disposeBag)
    }

    // MARK: - * UI Events --------------------


    // MARK: - * Memory Manage --------------------
    override func didMove(toParent parent: UIViewController?) {
        super.didMove(toParent: parent)
        if parent == nil {
            disposeBag = DisposeBag()
        }
    }
    
    deinit {
        #if DEBUG
        print("\(NSStringFromClass(type(of: self))) deinit")
        #endif
    }
}


extension MainViewController {

}
