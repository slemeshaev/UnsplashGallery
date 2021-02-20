//
//  NetworkService.swift
//  UnsplashGallery
//
//  Created by Станислав Лемешаев on 20.02.2021.
//

import UIKit

class NetworkService {
    
    // building a data request by URL
    func request(searchTerm: String, completion: (Data?, Error?) -> Void) {
        let parameters = self.prepareParameters(searchTerm: searchTerm)
        let url = self.url(params: parameters)
    }
    
    private func prepareParameters(searchTerm: String?) -> [String: String] {
        var parameters = [String: String]()
        parameters["query"] = searchTerm
        parameters["page"] = String(1)
        parameters["per_page"] = String(30)
        return parameters
    }
    
    private func url(params: [String: String]) -> URL {
        var components = URLComponents()
        components.scheme = API.scheme
        components.host = API.host
        components.path = API.path
        components.queryItems = params.map { URLQueryItem(name: $0, value: $1) }
        return components.url!
    }
    
}
