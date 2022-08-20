//
//  TVShowProvider.swift
//  TVShowApp
//
//  Created by Giuliano Accorsi on 03/07/22.
//

import Foundation
import Moya

enum TVShowError: Error {
    case decodeFailed
    case dataFileNil
    case tvShowNil
    case failure(String)
}

protocol TVShowProviderProtocol {
    var provider: MoyaProvider<TVShowTarget> {get}
    func request<T: Decodable>(
        target: TVShowTarget, parser: T.Type, completion: @escaping (Result<T, TVShowError>) -> Void)
}

class TVShowProvider: TVShowProviderProtocol {
    internal let provider: MoyaProvider<TVShowTarget>
    init(provider: MoyaProvider<TVShowTarget>) {
        self.provider = provider
    }
    func request<T: Decodable>(
        target: TVShowTarget, parser: T.Type, completion: @escaping (Result<T, TVShowError>) -> Void) {
        provider.request(target) { result in
            switch result {
            case .success(let response):
                do {
                    let result = try JSONDecoder().decode(T.self, from: response.data)
                    completion(.success(result))
                } catch {
                    completion(.failure(.decodeFailed))
                }
            case .failure(let error):
                completion(.failure(.failure(error.localizedDescription)))
            }
        }
    }
}
