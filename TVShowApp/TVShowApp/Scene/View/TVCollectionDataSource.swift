//
//  TVCollectionDataSource.swift
//  TVShowApp
//
//  Created by Giuliano Accorsi on 03/07/22.
//

import UIKit

protocol TVCollectionDataSourceDelegate: AnyObject {
    func didChangeIndex(index: Int, tvShow: TVShow)
}

final class TVCollectionDataSource: NSObject {
    
    private weak var collectionView: UICollectionView?
    private let delegate: TVCollectionDataSourceDelegate
    private var shows: [TVShow] = []
    private var selectedIndex: Int = 0
    
    init(collectionView: UICollectionView, delegate: TVCollectionDataSourceDelegate) {
        self.delegate = delegate
        super.init()
        self.collectionView = collectionView
        registerCells()
        setupDataSource()
    }
    
    private func registerCells() {
        collectionView?.register(TVShowCell.self, forCellWithReuseIdentifier: TVShowCell.identifier)
    }
    
    private func setupDataSource() {
        collectionView?.dataSource = self
        collectionView?.delegate = self
    }
    
    func updateShows(tvShows: [TVShow]) {
        self.shows = tvShows
        collectionView?.reloadData()
    }
    
    func changeItemSelected(index: Int) {
        if selectedIndex == index {
            return
        }
        isNOTSelected(index: selectedIndex)
        if index != selectedIndex {
            isSelected(index: index)
            self.selectedIndex = index
        }
    }
    
    func isSelected(index: Int) {
        if let cell = collectionView?.cellForItem(at: IndexPath(row: index, section: 0)) as? TVShowCell {
            cell.isSelectedCell()
        }
    }
    
    func isNOTSelected(index: Int) {
        if let cell = collectionView?.cellForItem(at: IndexPath(row: index, section: 0)) as? TVShowCell {
            cell.isNotSelectedCell()
        }
    }
}

extension TVCollectionDataSource: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screeWidth: CGFloat = UIScreen.main.bounds.width / 2 - 15
        return CGSize(width: screeWidth, height: 1.5 * screeWidth)
    }
}

extension TVCollectionDataSource: UICollectionViewDelegate {
        
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        var visibleRect = CGRect()
        visibleRect.origin = scrollView.contentOffset
        visibleRect.size = scrollView.bounds.size
        let visiblePoint = CGPoint(x: visibleRect.midX, y: visibleRect.midY)
        guard let itemCollection = self.collectionView?.indexPathForItem(at: visiblePoint) else { return }
        let index = itemCollection.item
        self.delegate.didChangeIndex(index: index, tvShow: shows[index])
    }
}

extension TVCollectionDataSource: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return shows.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell: TVShowCell = collectionView.dequeueReusableCell(withReuseIdentifier: TVShowCell.identifier, for: indexPath) as? TVShowCell else {return UICollectionViewCell()}
                
        let show = shows[indexPath.item]
        cell.setupCell(nameShow: show.name ?? "", urlPoster: show.posterURL)
        return cell
    }
}

