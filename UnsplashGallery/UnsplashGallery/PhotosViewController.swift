//
//  PhotosViewController.swift
//  UnsplashGallery
//
//  Created by Станислав Лемешаев on 19.02.2021.
//

import UIKit

class PhotosViewController: UICollectionViewController {
    
    // MARK: - Properties
    
    private static let reuseId = "PhotosCollectionCell"
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        collectionView.backgroundColor = .orange
    }
    
    // MARK: - Overrides functions
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 5
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotosViewController.reuseId, for: indexPath)
        cell.backgroundColor = .red
        return cell
    }
    
    // MARK: - Helpers
    
    private func setupCollectionView() {
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: PhotosViewController.reuseId)
    }
    
}

