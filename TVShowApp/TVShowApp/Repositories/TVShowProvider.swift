//
//  TVShowProvider.swift
//  TVShowApp
//
//  Created by Giuliano Accorsi on 03/07/22.
//

import Foundation
import PromiseKit
import Moya

enum TVShowError: Error {
    case decodeFailed
    case dataFileNil
    case tvShowNil
    case failure(String)
}

protocol TVShowProviderProtocol {
    var provider: MoyaProvider<TVShowTarget> {get}
    func request<T: Decodable>(target: TVShowTarget, parser: T.Type) -> Promise<T>
}

class TVShowProvider: TVShowProviderProtocol {
    
    internal let provider: MoyaProvider<TVShowTarget>
    init(provider: MoyaProvider<TVShowTarget>){
        self.provider = provider
    }
    
    func request<T: Decodable>(target: TVShowTarget, parser: T.Type) -> Promise<T> {
        return Promise { seal in
            provider.request(target) { result in
                switch result {
                case .success(let response):
                    do {
                        let results = try JSONDecoder().decode(T.self, from: response.data)
                        seal.fulfill(results)
                    } catch {
                        seal.reject(TVShowError.decodeFailed)
                    }
                case .failure(let error):
                    seal.reject(TVShowError.failure(error.localizedDescription))
                }
            }
        }
    }
}
