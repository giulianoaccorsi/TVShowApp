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
    
    
    let collectionView: UICollectionView = {
        let colletion = UICollectionView(frame: .zero , collectionViewLayout: UICollectionViewFlowLayout.init())
        let flowLayout = UPCarouselFlowLayout()
        flowLayout.itemSize = CGSize(width: UIScreen.main.bounds.size.width - 200, height: colletion.frame.size.height)
        flowLayout.scrollDirection = .horizontal
        flowLayout.sideItemScale = 0.4
        flowLayout.sideItemAlpha = 1.0
        flowLayout.spacingMode = .fixed(spacing: 20)
        flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 20)
        colletion.collectionViewLayout = flowLayout
        colletion.backgroundColor = .yellow
        colletion.translatesAutoresizingMaskIntoConstraints = false
        colletion.showsVerticalScrollIndicator = false
        colletion.showsHorizontalScrollIndicator = false
        return colletion
    }()
    
    var interactor: TVShowInteractorProtocol?
    var router: (TVShowRouterProtocol & TVShowDataPassing)?
    private lazy var dataSource = TVCollectionDataSource(collectionView: self.collectionView, delegate: self)
    
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
        dataSource.updateShows(tvShows: viewModel.showsList)
    }
    
    func displayError(viewModel: TVShowScenarios.Error.ViewModel) {
    }
}

extension TVShowViewController: TVCollectionDataSourceDelegate {
    func didChangeIndex(index: Int) {
        print("Index - \(index)")
        dataSource.changeItemSelected(index: index)
    }
}

extension TVShowViewController: ViewConfiguration {
    func buildViewHierarchy() {
        view.addSubview(collectionView)
    }
    
    func setUpConstraints() {
        
        NSLayoutConstraint.activate([
            collectionView.heightAnchor.constraint(equalToConstant: 350),
            collectionView.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    func setUpAdditionalConfiguration() {
        view.backgroundColor = .blue
    }
}
