//
//  TVShowInteractor.swift
//  TVShowApp
//
//  Created by Giuliano Accorsi on 03/07/22.
//

import UIKit

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
    var worker: TVShowWorker = TVShowWorker()
    
    func fetchTVShows(request: TVShowScenarios.Fetch.Request) {
        
        worker.getTVShows()
            .done { result in
                if let resultShows = result.results {
                    let response = TVShowScenarios.Fetch.Response(showsList: resultShows)
                    self.presenter?.presentTVShow(response: response)
                }
            }
            .catch { errorResult in
                let response = TVShowScenarios.Error.Response(error: errorResult.localizedDescription)
                self.presenter?.presentError(response: response)
            }
    }
    
    func changedItem(request: TVShowScenarios.Change.Request) {
        let response = TVShowScenarios.Change.Response(tvShow: request.tvShow)
        self.presenter?.presentChangedTVShow(response: response)
    }
}
