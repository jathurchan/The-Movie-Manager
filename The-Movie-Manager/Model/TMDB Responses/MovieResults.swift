//
//  MovieResults.swift
//  The-Movie-Manager
//
//  Created by Jathurchan Selvakumar on 20/04/2021.
//

import Foundation

struct MovieResults: Codable {
    
    let page: Int
    let results: [Movie]
    let totalPages: Int
    let totalResults: Int
    
    enum CodingKeys: String, CodingKey {
        case page
        case results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}
