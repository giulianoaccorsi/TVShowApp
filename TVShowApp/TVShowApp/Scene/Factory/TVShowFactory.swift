//
//  TVShowFactory.swift
//  TVShowApp
//
//  Created by Giuliano Accorsi on 03/07/22.
//

import UIKit

enum TVShowFactory {
    static func make() -> TVShowViewController {
        let interactor = TVShowInteractor()
        let router = TVShowRouter()
        let viewController = TVShowViewController(interactor: interactor, router: router)
        let presenter = TVShowPresenter()
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        return viewController
    }
}
