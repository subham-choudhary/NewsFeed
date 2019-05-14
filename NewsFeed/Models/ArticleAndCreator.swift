//
//  ArticleAndCreator.swift
//  NewsFeed
//
//  Created by Subham on 15/05/19.
//  Copyright © 2019 Subham. All rights reserved.
//

import Foundation
struct ArticleAndCreator: Decodable {
    let article: Article
    let creator: Creator
    enum CodingKeys: String, CodingKey {
        case article
        case creator
    }
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.article = try container.decode(Article.self, forKey: .article)
        self.creator = try container.decode(Creator.self, forKey: .creator)
    }
}
