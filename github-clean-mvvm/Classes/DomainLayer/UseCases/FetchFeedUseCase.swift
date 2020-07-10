//
//  FetchFeedUseCase.swift
//  github-clean-mvvm
//
//  Created by HS Lee on 2020/07/10.
//  Copyright © 2020 HS Lee. All rights reserved.
//

import Foundation

protocol GithubRepository {
    func fetchFeedUseCase()
}

class DefaultGithubRepository: GithubRepository {
    
    func fetchFeedUseCase() {
        let requestDTO = MoviesRequestDTO(query: query.query, page: page)
        let task = RepositoryTask()

        cache.getResponse(for: requestDTO) { result in

            if case let .success(responseDTO?) = result {
                cached(responseDTO.toDomain())
            }
            guard !task.isCancelled else { return }

            let endpoint = APIEndpoints.getMovies(with: requestDTO)
            task.networkTask = self.dataTransferService.request(with: endpoint) { result in
                switch result {
                case .success(let responseDTO):
                    self.cache.save(response: responseDTO, for: requestDTO)
                    completion(.success(responseDTO.toDomain()))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
        }
        return task
    }
}

// This is another option to create Use Case using more generic way
final class FetchFeedUseCase: UseCase {
    
//    struct RequestValue {
//        let maxCount: Int
//    }
//    typealias ResultValue = (Result<[MovieQuery], Error>)
//
//    private let requestValue: RequestValue
//    private let completion: (ResultValue) -> Void
//    private let moviesQueriesRepository: MoviesQueriesRepository
//
//    init(requestValue: RequestValue,
//         completion: @escaping (ResultValue) -> Void,
//         moviesQueriesRepository: MoviesQueriesRepository) {
//
//        self.requestValue = requestValue
//        self.completion = completion
//        self.moviesQueriesRepository = moviesQueriesRepository
//    }
    init(githubRepository: GithubRepository) {
        self.githubRepository = githubRepository
    }
    private let githubRepository: GithubRepository
    func start() {
        githubRepository.fetchFeedUseCase()
    }
//    func start() -> Cancellable? {
//
////        moviesQueriesRepository.fetchRecentsQueries(maxCount: requestValue.maxCount, completion: completion)
//        return nil
//    }
}
