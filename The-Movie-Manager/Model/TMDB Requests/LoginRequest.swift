//
//  LoginRequest.swift
//  The-Movie-Manager
//
//  Created by Jathurchan Selvakumar on 20/04/2021.
//

import Foundation

struct LoginRequest: Codable {
    let username: String
    let password: String
    let requestToken: String
    
    enum codingKeys: String, CodingKey{
        case username
        case password
        case requestToken = "request_token"
    }
}
