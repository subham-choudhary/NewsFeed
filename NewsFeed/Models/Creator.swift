//
//  Creator.swift
//  NewsFeed
//
//  Created by Subham on 15/05/19.
//  Copyright © 2019 Subham. All rights reserved.
//

import Foundation
struct Creator: Decodable {
    let imageLoc: String?
    let city: String
    let cityName: String
    let pkey: Double?
    let center: String
    let name: String
    let company: String
    
    enum CodingKeys: String, CodingKey {
        case imageLoc = "image_loc"
        case city
        case pKey
        case cityName = "city_name"
        case center = "center_name"
        case name
        case company
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.imageLoc = try container.decodeIfPresent(String.self, forKey: .imageLoc)
        self.pkey = try container.decodeIfPresent(Double.self, forKey: .pKey)
        self.city = try container.decode(String.self, forKey: .city)
        self.cityName = try container.decode(String.self, forKey: .cityName)
        self.center = try container.decode(String.self, forKey: .center)
        self.name = try container.decode(String.self, forKey: .name)
        self.company = try container.decode(String.self, forKey: .company)
    }
}
