//
//  TVShowRouter.swift
//  TVShowApp
//
//  Created by Giuliano Accorsi on 03/07/22.
//

import UIKit

protocol TVShowRouterProtocol {
    func routeToSomewhere()
}

class TVShowRouter: TVShowRouterProtocol {
    func routeToSomewhere() {
    }
    weak var viewController: TVShowViewController?
}
