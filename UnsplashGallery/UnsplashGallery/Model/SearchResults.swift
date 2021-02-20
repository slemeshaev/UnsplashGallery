//
//  SearchResults.swift
//  UnsplashGallery
//
//  Created by Станислав Лемешаев on 20.02.2021.
//

import UIKit

struct SearchResults: Decodable {
    let total: Int
    let results: [UnsplashPhoto]
}

struct UnsplashPhoto: Decodable {
    let width: Int
    let height: Int
    let urls: [URLKind.RawValue: String]
    
    enum URLKind: String {
        case raw
        case full
        case regular
        case small
        case thumb
    }
}

