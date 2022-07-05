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

class ShowView: UIView {
    let viewBackground: UIView = {
        let image = UIView(frame: .zero)
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.cornerRadius = 10
        image.backgroundColor = .black
        return image
    }()
    
    let showLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .yellow
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
            showLabel.textColor = .white
            viewBackground.backgroundColor = .black.withAlphaComponent(0.8)
        case .vote:
            viewBackground.backgroundColor = UIColor(red: 1.0, green: 0.8, blue: 0.008, alpha: 1.0)
            showLabel.textColor = .black
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
