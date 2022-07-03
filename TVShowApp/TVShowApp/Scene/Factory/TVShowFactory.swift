//
//  TVShowFactory.swift
//  TVShowApp
//
//  Created by Giuliano Accorsi on 03/07/22.
//

import UIKit

enum TVShowFactory {
    static func make() -> TVShowViewController {
        let viewController = TVShowViewController()
        let interactor = TVShowInteractor()
        let presenter = TVShowPresenter()
        let router = TVShowRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor

        return viewController
    }
}
