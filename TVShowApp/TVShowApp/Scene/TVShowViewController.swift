//
//  TVShowViewController.swift
//  TVShowApp
//
//  Created by Giuliano Accorsi on 03/07/22.
//

import UIKit

protocol TVShowViewControllerProtocol: AnyObject {
    func displayTVShows(viewModel: TVShowScenarios.Fetch.ViewModel)
    func displayError(viewModel: TVShowScenarios.Error.ViewModel)
}

class TVShowViewController: UIViewController, TVShowViewControllerProtocol {
    
    var interactor: TVShowInteractorProtocol?
    var router: (TVShowRouterProtocol & TVShowDataPassing)?
    
    // MARK: View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchShows()
        setUpView()
    }
    
    func fetchShows() {
        let request = TVShowScenarios.Fetch.Request()
        interactor?.fetchTVShows(request: request)
    }
    
    func displayTVShows(viewModel: TVShowScenarios.Fetch.ViewModel) {
        print(viewModel.showsList.count)
        print(viewModel.showsList[0])
    }
    
    func displayError(viewModel: TVShowScenarios.Error.ViewModel) {
    }
}

extension TVShowViewController: ViewConfiguration {
    func buildViewHierarchy() {
    }
    
    func setUpConstraints() {
    }
    
    func setUpAdditionalConfiguration() {
        view.backgroundColor = .blue
    }
    
    
}
