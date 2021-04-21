//
//  PostSession.swift
//  The-Movie-Manager
//
//  Created by Jathurchan Selvakumar on 21/04/2021.
//

import Foundation
 
struct PostSession: Codable {
    
    let requestToken: String
    
    enum CodingKeys: String, CodingKey {
        case requestToken = "request_token"
    }
    
}
