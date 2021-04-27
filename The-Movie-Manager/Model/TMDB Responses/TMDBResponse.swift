//
//  TMDBResponse.swift
//  The-Movie-Manager
//
//  Created by Jathurchan Selvakumar on 26/04/2021.
//

import Foundation

struct TMDBResponse: Codable {
    
    let statusCode: Int
    let statusMessage: String
    
    enum CodingKeys: String, CodingKey {
        case statusCode = "status_code"
        case statusMessage = "status_message"
    }
}

extension TMDBResponse: LocalizedError {
    var errorDescription: String? {
        return statusMessage
    }
}
