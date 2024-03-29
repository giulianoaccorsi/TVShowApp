//
//  viewBackground.swift
//  TVShowApp
//
//  Created by Giuliano Accorsi on 05/07/22.
//

import UIKit

enum ShowViewType {
    case year
    case vote
}

final class ShowView: UIView {
    private let viewBackground: UIView = {
        let image = UIView(frame: .zero)
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.cornerRadius = 10
        return image
    }()

    private let showLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textAlignment = .center
        return label
    }()

    init() {
        super.init(frame: .zero)
        setUpView()
    }

    func setupViewBackground(text: String, type: ShowViewType) {
        self.showLabel.text = text
        switch type {
        case .year:
            showLabel.textColor = Colors.yearLabel.color
            viewBackground.backgroundColor = Colors.backgroundViewYear.color
        case .vote:
            viewBackground.backgroundColor = Colors.backgroundViewVote.color
            showLabel.textColor = Colors.voteLabel.color
        }
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError(Localization.Generic.fatalErrorNSCoder)
    }
}

extension ShowView: ViewConfiguration {
    func buildViewHierarchy() {
        self.addSubview(viewBackground)
        viewBackground.addSubview(showLabel)
    }

    func setUpConstraints() {
        NSLayoutConstraint.activate([
            viewBackground.topAnchor.constraint(equalTo: self.topAnchor),
            viewBackground.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            viewBackground.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            viewBackground.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            showLabel.topAnchor.constraint(equalTo: viewBackground.topAnchor),
            showLabel.bottomAnchor.constraint(equalTo: viewBackground.bottomAnchor),
            showLabel.leadingAnchor.constraint(equalTo: viewBackground.leadingAnchor),
            showLabel.trailingAnchor.constraint(equalTo: viewBackground.trailingAnchor)
        ])
    }

    func setUpAdditionalConfiguration() {
    }
}
