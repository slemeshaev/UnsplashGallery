//
//  FavoritesCell.swift
//  UnsplashGallery
//
//  Created by Станислав Лемешаев on 22.02.2021.
//

import UIKit
import Kingfisher

class FavoritesCell: UICollectionViewCell {
    
    // MARK: - Properties
    
    static let reuseId = "FavoritesCell"
    
    var myImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .green
        return imageView
    }()
    
    var unsplashPhoto: UnsplashPhoto! {
        didSet {
            let photoUrl = unsplashPhoto.urls["regular"]
            guard let imageUrl = photoUrl, let url = URL(string: imageUrl) else { return }
            myImageView.kf.setImage(with: url)
        }
    }
    
    // MARK: - Lifecycle
    
    override func prepareForReuse() {
        super.prepareForReuse()
        myImageView.image = nil
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .green
        setupImageView()
    }
    
    // MARK: - Helpers
    
    private func setupImageView() {
        addSubview(myImageView)
        myImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        myImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        myImageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        myImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
    
    private func set(photo: UnsplashPhoto) {
        let photoUrl = photo.urls["full"]
        guard let photoURL = photoUrl, let url = URL(string: photoURL) else { return }
        myImageView.kf.setImage(with: url)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

