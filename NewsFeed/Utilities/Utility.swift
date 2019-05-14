//
//  Utility.swift
//  NewsFeed
//
//  Created by Subham on 14/05/19.
//  Copyright © 2019 Subham. All rights reserved.
//

import Foundation
import UIKit

class Utility {
    private init() {
    }
    static let shared = Utility()
    let imageCache = NSCache<NSString, UIImage>()
    
    func readJSON() -> Payload? {
        if let url = Bundle.main.url(forResource: "data", withExtension: "json") {
            guard let data = NSData(contentsOf: url) else {
                return nil
            }
            do {
                let model = try JSONDecoder().decode(Payload.self, from: data as Data)
                return model
            } catch {
                return nil
            }
        }
        return nil
    }
    
}
