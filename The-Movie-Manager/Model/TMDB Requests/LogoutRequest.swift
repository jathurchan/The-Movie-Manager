//
//  LogoutRequest.swift
//  The-Movie-Manager
//
//  Created by Jathurchan Selvakumar on 23/04/2021.
//

import Foundation

struct LogoutRequest: Codable {
    
    let sessionId: String
    
    enum CodingKeys: String, CodingKey{
        case sessionId = "session_id"
    }
    
}
