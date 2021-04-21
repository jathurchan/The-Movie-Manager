//
//  SessionResponse.swift
//  The-Movie-Manager
//
//  Created by Jathurchan Selvakumar on 21/04/2021.
//

import Foundation

struct SessionResponse: Codable {
    
    let success: Bool
    let sessionId: String
    
    enum CodingKeys: String, CodingKey {
        case success
        case sessionId = "session_id"
    }
}
