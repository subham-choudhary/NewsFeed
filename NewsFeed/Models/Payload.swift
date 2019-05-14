//
//  Payload.swift
//  NewsFeed
//
//  Created by Subham on 15/05/19.
//  Copyright © 2019 Subham. All rights reserved.
//

import Foundation
struct Payload: Decodable {
    let message: String
    let data: [ArticleAndCreator]
    let status: Bool
    enum CodingKeys: String, CodingKey {
        case data
        case message
        case status
    }
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.data = try container.decode([ArticleAndCreator].self, forKey: .data)
        self.message = try container.decode(String.self, forKey: .message)
        self.status = try container.decode(Bool.self, forKey: .status)
    }
}
