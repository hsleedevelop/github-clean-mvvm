//
//  MainViewModel.swift
//  github-clean-mvvm
//
//  Created by HS Lee on 2020/07/10.
//  Copyright © 2020 HS Lee. All rights reserved.
//

import Foundation

import RxSwift
import RxCocoa
import RxSwiftExt
    
final class MainViewModel: ViewModelType {
    struct Input {
        var fetchList: Observable<Void>
        var search: Observable<(String, Int)>
        var photoPressed: Observable<Int>
    }
    
    struct Output {
//        var list: Driver<[String]>
//        var currentIndex: Driver<Int>
        var isLoading: Driver<Bool>
        var error: Driver<Error>
    }
    
    func transform(input: Input) -> Output {
        let activity = ActivityIndicator()
        let errorTracker = ErrorTracker()
        
        return .init(isLoading: activity.asDriver(),
                     error: errorTracker.asDriver())
    }
}
