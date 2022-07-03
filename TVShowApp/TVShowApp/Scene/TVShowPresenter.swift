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
}

class TVShowPresenter: TVShowPresenterProtocol {
    
    weak var viewController: TVShowViewControllerProtocol?
    
    func presentTVShow(response: TVShowScenarios.Fetch.Response) {
        let viewModel = TVShowScenarios.Fetch.ViewModel(showsList: response.showsList)
        viewController?.displayTVShows(viewModel: viewModel)
    }
    
    func presentError(response: TVShowScenarios.Error.Response) {
        let viewModel = TVShowScenarios.Error.ViewModel()
        viewController?.displayError(viewModel: viewModel)
    }
}
