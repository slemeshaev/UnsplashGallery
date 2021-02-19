//
//  MainTabbarController.swift
//  UnsplashGallery
//
//  Created by Станислав Лемешаев on 19.02.2021.
//

import UIKit

class MainTabbarController: UITabBarController {
    
    override func viewDidLoad() {
        view.backgroundColor = .gray
        let photosVC = PhotosCollectionViewController(collectionViewLayout: UICollectionViewLayout())
        let favoritesVC = FavoritesViewController()
        
        viewControllers = [photosVC, favoritesVC]
    }
    
}

