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
        label.text = "ФОТОГРАФИИ"
        label.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        label.textColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        return label
    }()
    
    private lazy var addBarButtonItem: UIBarButtonItem = {
        let barButtonItem = UIBarButtonItem(barButtonSystemItem: .add,
                                            target: self,
                                            action: #selector(addBarButtonTapped))
        return barButtonItem
    }()
    
    private lazy var actionBarButtonItem: UIBarButtonItem = {
        let barButtonItem = UIBarButtonItem(barButtonSystemItem: .action,
                                            target: self,
                                            action: #selector(actionBarButtonTapped))
        return barButtonItem
    }()
    
    private var networkDataFetcher = NetworkDataFetcher()
    private var timer: Timer?
    private var photos = [UnsplashPhoto]()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        setupSearchBar()
        setupNavigationBar()
        setupCollectionView()
    }
    
    // MARK: - Overrides functions
    
    override func collectionView(_ collectionView: UICollectionView,
                                 numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    
    override func collectionView(_ collectionView: UICollectionView,
                                 cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotosCell.reuseId, for: indexPath) as! PhotosCell
        let unsplashPhoto = photos[indexPath.item]
        cell.unsplashPhoto = unsplashPhoto
        return cell
    }
    
    // MARK: - Actions
    
    @objc func addBarButtonTapped() {
        print(#function)
    }
    
    @objc func actionBarButtonTapped() {
        print(#function)
    }
    
    // MARK: - Helpers
    
    private func setupCollectionView() {
        collectionView.register(PhotosCell.self, forCellWithReuseIdentifier: PhotosCell.reuseId)
        collectionView.backgroundColor = .orange
    }
    
    private func setupNavigationBar() {
        navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: titleLabel)
        navigationItem.rightBarButtonItems = [actionBarButtonItem, addBarButtonItem]
    }
    
    private func setupSearchBar() {
        let searchController = UISearchController(searchResultsController: nil)
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Поиск"
        searchController.searchBar.delegate = self
    }
    
}

// MARK: - SearchBarDelegate

extension PhotosViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false, block: { (_) in
            self.networkDataFetcher.fetchImages(searchTerm: searchText) { [weak self] (searchResults) in
                guard let fetchedPhotos = searchResults else { return }
                self?.photos = fetchedPhotos.results
            }
        })
    }
}
