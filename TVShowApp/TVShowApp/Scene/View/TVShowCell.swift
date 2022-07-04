//
//  TVShowCell.swift
//  TVShowApp
//
//  Created by Giuliano Accorsi on 03/07/22.
//

import UIKit
import Kingfisher

class TVShowCell: UICollectionViewCell {
    
    static let identifier: String = "TVShowCell"
    
    let posterImageView: UIImageView = {
        let image = UIImageView(frame: .zero)
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let nameLabel: UILabel = {
        let title = UILabel(frame: .zero)
        title.translatesAutoresizingMaskIntoConstraints = false
        title.numberOfLines = 0
        title.textAlignment = .center
        title.font = UIFont.boldSystemFont(ofSize: 17)
        title.textColor = .white
        return title
    }()
    
    let blackView: UIView = {
        let view = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.black.withAlphaComponent(0.85)
        return view
    }()
    
    let viewBackground: UIView = {
        let view = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.black.withAlphaComponent(0.8)
        view.layer.cornerRadius = 20
        view.clipsToBounds = true
        return view
    }()
    
    func setupCell(nameShow: String, urlPoster: URL) {
        nameLabel.text = nameShow
        posterImageView.kf.setImage(with: urlPoster)
        setUpView()
    }
    
    func isSelectedCell() {
        nameLabel.isHidden = false
        blackView.isHidden = false
    }
    
    func isNotSelectedCell() {
        UIView.transition(with: nameLabel, duration: 0.4,
                          options: .transitionCrossDissolve,
                          animations: {
            self.nameLabel.isHidden = true
        })
        UIView.transition(with: blackView, duration: 0.4,
                          options: .transitionCrossDissolve,
                          animations: {
            self.blackView.isHidden = true
        })
    }
}
extension TVShowCell: ViewConfiguration {
    func buildViewHierarchy() {
        contentView.addSubview(viewBackground)
        viewBackground.addSubview(posterImageView)
        viewBackground.addSubview(blackView)
        viewBackground.addSubview(nameLabel)
    }
    
    func setUpConstraints() {
        NSLayoutConstraint.activate([
            viewBackground.topAnchor.constraint(equalTo: contentView.topAnchor),
            viewBackground.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            viewBackground.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            viewBackground.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            posterImageView.topAnchor.constraint(equalTo: viewBackground.topAnchor),
            posterImageView.bottomAnchor.constraint(equalTo: viewBackground.bottomAnchor),
            posterImageView.leadingAnchor.constraint(equalTo: viewBackground.leadingAnchor),
            posterImageView.trailingAnchor.constraint(equalTo: viewBackground.trailingAnchor),
            
            blackView.heightAnchor.constraint(equalToConstant: 60),
            blackView.bottomAnchor.constraint(equalTo: viewBackground.bottomAnchor),
            blackView.leadingAnchor.constraint(equalTo: viewBackground.leadingAnchor),
            blackView.trailingAnchor.constraint(equalTo: viewBackground.trailingAnchor),
            
            nameLabel.topAnchor.constraint(equalTo: blackView.topAnchor),
            nameLabel.bottomAnchor.constraint(equalTo: blackView.bottomAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: blackView.leadingAnchor),
            nameLabel.trailingAnchor.constraint(equalTo: blackView.trailingAnchor)
            
        ])
    }
    
    func setUpAdditionalConfiguration() {
        nameLabel.isHidden = true
        blackView.isHidden = true
    }
    
    
}
