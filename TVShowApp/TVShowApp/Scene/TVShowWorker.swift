//
//  TVShowWorker.swift
//  TVShowApp
//
//  Created by Giuliano Accorsi on 03/07/22.
//

import UIKit
import Moya

class TVShowWorker {
    let serviceProvider: TVShowProviderProtocol

    init(serviceProvider: TVShowProviderProtocol = TVShowProvider(provider: MoyaProvider<TVShowTarget>())) {
        self.serviceProvider = serviceProvider
    }
    func getTVShows(page: String, completion: @escaping (Result<ResultAPI, TVShowError>) -> Void) {
        serviceProvider.request(target: .fetchMore(page: page), parser: ResultAPI.self) { result in
            switch result {
            case .success(let resultAPI):
                completion(.success(resultAPI))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
