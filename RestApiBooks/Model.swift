//
//  RestApiModel.swift
//  RestApiBooks
//
//  Created by Іван Захарчук on 29.01.2021.
//

import Foundation

struct BooksResponse: Decodable {
//    var resultCount: Int
    let  results: [Books]
    
    private enum CodingKeys: String, CodingKey {
        case results = "result"
    }
}

struct Books: Decodable {
    let id: Int?
    let title: String?
    let author: String?
    let price: Int?
    
    private enum CodingKeys: String, CodingKey {
        case id = "id"
        case title = "title"
        case author = "author"
        case price = "price"
    }
}
