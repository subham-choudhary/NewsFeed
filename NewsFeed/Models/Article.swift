//
//  Article.swift
//  NewsFeed
//
//  Created by Subham on 15/05/19.
//  Copyright © 2019 Subham. All rights reserved.
//

import Foundation

struct Article: Decodable {
    let likes: [Likes]?
    let comments: [Comments]?
    let imageLoc: String?
    let city: String
    let akey: Double?
    let center: String
    let centerID: Double
    let timelog: Double
    let content: AnyValue
    
    enum CodingKeys: String, CodingKey {
        case likes
        case comments
        case imageLoc = "image_loc"
        case aKey
        case city = "city_name"
        case center = "center_name"
        case centerID = "center_id"
        case timelog
        case content
    }
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.imageLoc = try container.decodeIfPresent(String.self, forKey: .imageLoc)
        self.akey = try container.decodeIfPresent(Double.self, forKey: .aKey)
        self.city = try container.decode(String.self, forKey: .city)
        self.center = try container.decode(String.self, forKey: .center)
        self.likes = try container.decodeIfPresent([Likes].self, forKey: .likes)
        self.timelog = try container.decode(Double.self, forKey: .timelog)
        self.centerID = try container.decode(Double.self, forKey: .centerID)
        self.comments = try container.decodeIfPresent([Comments].self, forKey: .comments)
        self.content = try container.decode(AnyValue.self, forKey: .content)
    }
}
