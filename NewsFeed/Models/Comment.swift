//
//  Comment.swift
//  NewsFeed
//
//  Created by Subham on 15/05/19.
//  Copyright © 2019 Subham. All rights reserved.
//

import Foundation
struct Comments: Decodable {
    let imageLoc: String?
    let ckey: Double?
    let city: String
    let center: String
    let name: String
    let timelog: Double
    let company: String
    let pkey: Double?
    let content: AnyValue
    enum CodingKeys: String, CodingKey {
        case imageLoc = "image_loc"
        case cKey
        case city
        case center
        case name
        case timelog
        case company
        case pkey
        case content
    }
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.imageLoc = try container.decodeIfPresent(String.self, forKey: .imageLoc)
        self.ckey = try container.decodeIfPresent(Double.self, forKey: .cKey)
        self.city = try container.decode(String.self, forKey: .city)
        self.center = try container.decode(String.self, forKey: .center)
        self.name = try container.decode(String.self, forKey: .name)
        self.timelog = try container.decode(Double.self, forKey: .timelog)
        self.company = try container.decode(String.self, forKey: .company)
        self.pkey = try container.decodeIfPresent(Double.self, forKey: .pkey)
        self.content = try container.decode(AnyValue.self, forKey: .content)
    }
}
