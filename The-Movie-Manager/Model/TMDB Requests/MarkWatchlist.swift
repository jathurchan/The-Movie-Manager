//
//  MarkWatchlist.swift
//  The-Movie-Manager
//
//  Created by Jathurchan Selvakumar on 26/04/2021.
//

import Foundation

struct MarkWatchlist: Codable {
    let mediaType: String
    let mediaId: Int
    let watchlist: Bool
    
    enum CodingKeys: String, CodingKey {
        case mediaType = "media_type"
        case mediaId = "media_id"
        case watchlist = "watchlist"
    }
    
}
