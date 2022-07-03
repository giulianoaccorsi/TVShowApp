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

protocol TVShowDataPassing {
    var dataStore: TVShowDataStore? {get}
}

class TVShowRouter: TVShowRouterProtocol, TVShowDataPassing {
    var dataStore: TVShowDataStore?
    
    func routeToSomewhere() {
    }

    weak var viewController: TVShowViewController?
    
}

