//
//  RestApiService.swift
//  RestApiBooks
//
//  Created by Іван Захарчук on 26.01.2021.
//

import Foundation

class RestApiService {
    func request(urlString: String, complition: @escaping (Result<Data, Error>) -> Void) {
        guard let url = URL(string: urlString) else {return}
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            DispatchQueue.main.async {
                if let error = error {
                    complition(.failure(error))
                    return
                }
                guard let data = data else {return}
                complition(.success(data))
            }
        }.resume()
    }
}
