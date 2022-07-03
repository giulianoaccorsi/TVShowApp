//
//  TVShowWorker.swift
//  TVShowApp
//
//  Created by Giuliano Accorsi on 03/07/22.
//

import UIKit
import PromiseKit
import Moya

class TVShowWorker {

    let serviceProvider: TVShowProviderProtocol

    init(serviceProvider: TVShowProviderProtocol = TVShowProvider(provider: MoyaProvider<TVShowTarget>())) {
        self.serviceProvider = serviceProvider
    }
    
    func getTVShows(page: Int = 1) -> Promise<Result> {
        return serviceProvider.request(target: .loadTVShow, parser: Result.self)
    }
}
