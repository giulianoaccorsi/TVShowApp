//
//  TVShowPresenter.swift
//  TVShowApp
//
//  Created by Giuliano Accorsi on 03/07/22.
//

import UIKit

protocol TVShowPresenterProtocol {
    func presentTVShow(response: TVShowScenarios.Fetch.Response)
    func presentError(response: TVShowScenarios.Error.Response)
    func presentChangedTVShow(response: TVShowScenarios.Change.Response)
}

final class TVShowPresenter: TVShowPresenterProtocol {
    weak var viewController: TVShowViewControllerProtocol?
    func presentTVShow(response: TVShowScenarios.Fetch.Response) {
        let viewModel = TVShowScenarios.Fetch.ViewModel(showsList: response.showsList)
        viewController?.displayTVShows(viewModel: viewModel)
    }
    func presentError(response: TVShowScenarios.Error.Response) {
        let viewModel = TVShowScenarios.Error.ViewModel()
        viewController?.displayError(viewModel: viewModel)
    }
    func presentChangedTVShow(response: TVShowScenarios.Change.Response) {
        let backgroundURL = response.tvShow.posterURL
        let year = response.tvShow.date
        let avarageVote = response.tvShow.voteAverageString
        let name = response.tvShow.name ?? ""
        let viewModel = TVShowScenarios.Change.ViewModel(
            year: year,
            voteAverage: avarageVote,
            backgroundImage: backgroundURL,
            name: name)
        viewController?.displayChangedTVShow(viewModel: viewModel)
    }
}
