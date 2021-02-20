//
//  MainTabbarController.swift
//  UnsplashGallery
//
//  Created by Станислав Лемешаев on 19.02.2021.
//

import UIKit

class MainTabbarController: UITabBarController {
    
    // MARK: - Properties
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        let photosVC = PhotosCollectionViewController(collectionViewLayout: UICollectionViewLayout())
        let favoritesVC = FavoritesViewController()
        
        let navigationPhotosVC = createNavigationViewController(rootVC: photosVC, title: "Фото", image: createImageIcon(nameImage: "photo.on.rectangle"))
        let navigationFavoritesVC = createNavigationViewController(rootVC: favoritesVC, title: "Избранное", image: createImageIcon(nameImage: "suit.heart.fill"))
        
        viewControllers = [navigationPhotosVC, navigationFavoritesVC]
    }
    
    // MARK: - Helpers
    
    private func createNavigationViewController(rootVC: UIViewController, title: String, image: UIImage) -> UIViewController {
        let navigationVC = UINavigationController(rootViewController: rootVC)
        navigationVC.tabBarItem.title = title
        navigationVC.tabBarItem.image = image
        return navigationVC
    }
    
    private func createImageIcon(nameImage: String) -> UIImage {
        guard let image = UIImage(systemName: nameImage) else { return UIImage() }
        return image
    }
    
    
}

