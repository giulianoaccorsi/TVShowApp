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
    var resultShows: ResultAPI? {get set}
}

class TVShowInteractor: TVShowInteractorProtocol, TVShowDataStore {
    var resultShows: ResultAPI?
    var presenter: TVShowPresenterProtocol?
    var worker = TVShowWorker()
    var pageIndex: Int = 1
    var tvShows: [TVShow] = []
    func fetchTVShows(request: TVShowScenarios.Fetch.Request) {
        let pageString = String(pageIndex)
        worker.getTVShows(page: pageString) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let resultAPI):
                guard let resultShows = resultAPI.results else { return }
                self.tvShows.append(contentsOf: resultShows)
                let response = TVShowScenarios.Fetch.Response(showsList: self.tvShows)
                self.presenter?.presentTVShow(response: response)
                self.pageIndex += 1
            case .failure(let error):
                let response = TVShowScenarios.Error.Response(error: error.localizedDescription)
                self.presenter?.presentError(response: response)
            }
        }
    }
    func changedItem(request: TVShowScenarios.Change.Request) {
        let response = TVShowScenarios.Change.Response(tvShow: request.tvShow)
        self.presenter?.presentChangedTVShow(response: response)
    }
}
