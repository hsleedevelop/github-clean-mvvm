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
import RxDataSources

struct GithubJobSection {
  var header: String
  var items: [Item]
}

extension GithubJobSection: SectionModelType {
  typealias Item = GithubJob

   init(original: GithubJobSection, items: [Item]) {
    self = original
    self.items = items
  }
}

class MainViewController: UIViewController, Alertable {
    typealias ViewModelType = MainViewModel
    
    static func create(with viewModel: ViewModelType) -> MainViewController {
        guard let viewController = UIStoryboard(name: "MainScene", bundle: Bundle.main).instantiateViewController(withIdentifier: "MainViewController") as? MainViewController else {
            fatalError("MainViewController can't load")
        }
        viewController.viewModel = viewModel
        return viewController
    }
    
    // MARK: - * properties --------------------
    var viewModel: ViewModelType!
    private var disposeBag = DisposeBag()

    // MARK: - * IBOutlets --------------------
    @IBOutlet weak var tableView: UITableView!

    // MARK: - * Initialize --------------------

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupAppearances()
        setupTableView()
        bindViewModel()
    }

    private func setupAppearances() {
        title = "Jobs"
    }
    
    private func setupTableView() {
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 300
        
        tableView.separatorStyle = .singleLine
        tableView.backgroundColor = .white
        tableView.tableFooterView = UIView()
    }
       

    // MARK: - * Main Logic --------------------
    private func bindViewModel() {
        let input = ViewModelType.Input.init(fetchList: .just(()))
        let output = viewModel.transform(input: input)
        
        output.list
//            .map { [GithubJobSection.init(header: "1", items: $0)]}
//            .drive(tableView.rx.items(dataSource: dataSource))
            .drive(tableView.rx.items)({ (tv, row, job) -> UITableViewCell in
                guard let cell = tv.dequeueReusableCell(withIdentifier: "MainTableViewCell", for: .init(row: row, section: 0)) as? MainTableViewCell else {
                    fatalError("MainTableViewCell not found.")
                }
                cell.configure(job)
                return cell
            })
            .disposed(by: disposeBag)
        
        let dataSource = RxTableViewSectionedReloadDataSource<GithubJobSection>(configureCell: { dataSource, tv, indexPath, item in
            guard let cell = tv.dequeueReusableCell(withIdentifier: "MainTableViewCell", for: indexPath) as? MainTableViewCell else {
                fatalError("MainTableViewCell not found.")
            }
            cell.configure(item)
            return cell
        })
        
        output.list
            .map { [GithubJobSection.init(header: "1", items: $0)]}
            .drive(tableView.rx.items(dataSource: dataSource))
            .disposed(by: disposeBag)
        
        output.error
            .do(onNext: { error in
                print(error.localizedDescription)
            })
            .drive(onNext: { [weak self] error in
                guard let self = self else { return }
                self.showAlert(message: error.localizedDescription)
            })
            .disposed(by: disposeBag)
    }

    // MARK: - * Memory Manage --------------------
    override func didMove(toParent parent: UIViewController?) {
        super.didMove(toParent: parent)
        if parent == nil {
            disposeBag = DisposeBag()
        }
    }
}
