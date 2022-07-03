//
//  ViewConfiguration.swift
//  TVShowApp
//
//  Created by Giuliano Accorsi on 03/07/22.
//

import Foundation

protocol ViewConfiguration {
    func buildViewHierarchy()
    func setUpConstraints()
    func setUpAdditionalConfiguration()
    func setUpView()
}

extension ViewConfiguration {
    func setUpView() {
        buildViewHierarchy()
        setUpConstraints()
        setUpAdditionalConfiguration()
    }
}
