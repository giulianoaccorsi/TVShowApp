//
//  TVShowInteractor.swift
//  TVShowApp
//
//  Created by Giuliano Accorsi on 03/07/22.
//

import UIKit

protocol TVShowInteractorProtocol {
    func fetchTVShows(request: TVShowScenarios.Fetch.Request)
    func changedItem(request: TVShowScenarios.Change.Request)
}

protocol TVShowDataStore {
    var resultShows: Result? {get set}
}

class TVShowInteractor: TVShowInteractorProtocol, TVShowDataStore {
    var resultShows: Result?
    var presenter: TVShowPresenterProtocol?
    var worker = TVShowWorker()
    var pageIndex: Int = 1
    var tvShows: [TVShow] = []
    func fetchTVShows(request: TVShowScenarios.Fetch.Request) {
        let pageString = String(pageIndex)
        worker.getTVShows(page: pageString)
            .done { [weak self] result in
                if let resultShows = result.results {
                    guard let self = self else { return }
                    self.tvShows.append(contentsOf: resultShows)
                    let response = TVShowScenarios.Fetch.Response(showsList: self.tvShows)
                    self.presenter?.presentTVShow(response: response)
                    self.pageIndex += 1
                }
            }
            .catch { [weak self] errorResult in
                let response = TVShowScenarios.Error.Response(error: errorResult.localizedDescription)
                self?.presenter?.presentError(response: response)
            }
    }
    func changedItem(request: TVShowScenarios.Change.Request) {
        let response = TVShowScenarios.Change.Response(tvShow: request.tvShow)
        self.presenter?.presentChangedTVShow(response: response)
    }
}
