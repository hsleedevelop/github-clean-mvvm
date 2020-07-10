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
        let apiService: APIService
    }
    
    private let dependencies: Dependencies
    
    init(dependencies: Dependencies) {
        self.dependencies = dependencies
    }
}
