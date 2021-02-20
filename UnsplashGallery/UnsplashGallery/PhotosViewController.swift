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
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "PHOTOS"
        label.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        label.textColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        return label
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        collectionView.backgroundColor = .orange
        setupNavigationBar()
        setupCollectionView()
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
    
    private func setupNavigationBar() {
        let label = UILabel()
        label.text = "PHOTOS"
        label.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        label.textColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: label)
    }
    
}

