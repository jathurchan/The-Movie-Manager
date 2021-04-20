//
//  RequestTokenResponse.swift
//  The-Movie-Manager
//
//  Created by Jathurchan Selvakumar on 20/04/2021.
//

import Foundation

struct RequestTokenResponse: Codable {
    
    let success: Bool
    let expiresAt: String
    let requestToken: String
    
    enum CodingKeys: String, CodingKey {
        case success
        case expiresAt = "expires_at"
        case requestToken = "request_token"
    }
    
}
