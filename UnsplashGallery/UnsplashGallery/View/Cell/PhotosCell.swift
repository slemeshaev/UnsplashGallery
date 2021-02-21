//
//  PhotosCell.swift
//  UnsplashGallery
//
//  Created by Станислав Лемешаев on 21.02.2021.
//

import UIKit

class PhotosCell: UICollectionViewCell {
    
    static let reuseId = "PhotosCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
