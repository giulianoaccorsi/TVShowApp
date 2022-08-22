//
//  TVShowFactory.swift
//  TVShowApp
//
//  Created by Giuliano Accorsi on 03/07/22.
//

import UIKit

enum TVShowFactory {
    static func make() -> TVShowViewController {
        let worker = TVShowWorker()
        let presenter = TVShowPresenter()
        let interactor = TVShowInteractor(presenter: presenter, worker: worker)
        let viewController = TVShowViewController(interactor: interactor)
        presenter.viewController = viewController
        return viewController
    }
}
