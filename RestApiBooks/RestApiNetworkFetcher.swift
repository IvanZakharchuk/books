//
//  RestApiNetworkFetcher.swift
//  RestApiBooks
//
//  Created by Іван Захарчук on 28.01.2021.
//

import Foundation

class RestApiNetworkDataFetcher {
    
    let networkService = RestApiService()
    
    func fetchBooks(urlString: String, response: @escaping ([Books]?) -> Void) {
        networkService.request(urlString: urlString) { (result) in
            print(result)
            switch result {
            case .success(let data):
                do {
                    print(data)
                    let tracks = try JSONDecoder().decode([Books].self, from: data)
                    response(tracks)
                } catch let jsonError {
                    print("Failed to decode JSON", jsonError)
                    response(nil)
                }
            case .failure(let error):
                print("Error received requesting data: \(error.localizedDescription)")
                response(nil)
            }
        }
    }
}


