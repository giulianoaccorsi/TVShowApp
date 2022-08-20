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
    func displayChangedTVShow(viewModel: TVShowScenarios.Change.ViewModel)
}

final class TVShowViewController: UIViewController, TVShowViewControllerProtocol {
    private lazy var collectionView: UICollectionView = {
        let colletion = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout.init())
        colletion.backgroundColor = .clear
        let flowLayout = UPCarouselFlowLayout()
        flowLayout.itemSize = CGSize(width: UIScreen.main.bounds.size.width - 200, height: colletion.frame.size.height)
        flowLayout.scrollDirection = .horizontal
        flowLayout.sideItemScale = 0.4
        flowLayout.sideItemAlpha = 1.0
        flowLayout.spacingMode = .fixed(spacing: 20)
        flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 10)
        colletion.collectionViewLayout = flowLayout
        colletion.translatesAutoresizingMaskIntoConstraints = false
        colletion.showsVerticalScrollIndicator = false
        colletion.showsHorizontalScrollIndicator = false
        return colletion
    }()
    private lazy var backgroundImageView: UIImageView = {
        let image = UIImageView(frame: .zero)
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleToFill
        return image
    }()
    let yearView: ShowView = {
        let view = ShowView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let voteAverageView: ShowView = {
        let view = ShowView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var stackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [yearView, voteAverageView])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.distribution = .fillEqually
        stack.spacing = 10
        stack.axis = .horizontal
        return stack
    }()
    let showLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.textAlignment = .center
        return label
    }()
    let titleView: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textAlignment = .center
        return label
    }()
    let interactor: TVShowInteractorProtocol
    let router: TVShowRouterProtocol
    private lazy var dataSource = TVCollectionDataSource(collectionView: self.collectionView, delegate: self)
    init(interactor: TVShowInteractor, router: TVShowRouterProtocol) {
        self.interactor = interactor
        self.router = router
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchShows()
        setUpView()
    }
    func fetchShows() {
        let request = TVShowScenarios.Fetch.Request()
        interactor.fetchTVShows(request: request)
    }
    func displayTVShows(viewModel: TVShowScenarios.Fetch.ViewModel) {
        dataSource.updateShows(tvShows: viewModel.showsList)
        let request = TVShowScenarios.Change.Request(tvShow: viewModel.showsList[0])
        interactor.changedItem(request: request)
    }
    func displayError(viewModel: TVShowScenarios.Error.ViewModel) {
    }
    func displayChangedTVShow(viewModel: TVShowScenarios.Change.ViewModel) {
        backgroundImageView.kf.setImage(with: viewModel.backgroundImage)
        yearView.setupViewBackground(text: viewModel.year, type: .year)
        voteAverageView.setupViewBackground(text: viewModel.voteAverage, type: .vote)
        showLabel.text = viewModel.name
    }
}

extension TVShowViewController: TVCollectionDataSourceDelegate {
    func loadMore() {
        fetchShows()
    }
    func didChangeIndex(index: Int, tvShow: TVShow) {
        dataSource.changeItemSelected(index: index)
        let request = TVShowScenarios.Change.Request(tvShow: tvShow)
        self.interactor.changedItem(request: request)
    }
}

extension TVShowViewController: ViewConfiguration {
    func buildViewHierarchy() {
        view.addSubview(backgroundImageView)
        view.addSubview(collectionView)
        view.addSubview(stackView)
        view.addSubview(showLabel)
        view.addSubview(titleView)
    }
    func setUpConstraints() {
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: 350),
            collectionView.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            stackView.heightAnchor.constraint(equalToConstant: 50),
            stackView.widthAnchor.constraint(equalToConstant: 150),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.bottomAnchor.constraint(equalTo: collectionView.topAnchor, constant: -80),
            showLabel.heightAnchor.constraint(equalToConstant: 50),
            showLabel.bottomAnchor.constraint(equalTo: stackView.topAnchor, constant: -8),
            showLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            showLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            titleView.heightAnchor.constraint(equalToConstant: 50),
            titleView.centerXAnchor.constraint(equalTo: showLabel.centerXAnchor),
            titleView.bottomAnchor.constraint(equalTo: showLabel.topAnchor)
        ])
    }
    func setUpAdditionalConfiguration() {
        backgroundImageView.addBlackGradientLayerInBackground(frame: view.bounds, colors: [.clear, .black])
        titleView.text = "Popular • Serie"
    }
}
