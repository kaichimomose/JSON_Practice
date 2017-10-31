//
//  Root.swift
//  JSON_Practice
//
//  Created by Kaichi Momose on 2017/10/27.
//  Copyright © 2017 Kaichi Momose. All rights reserved.
//

import Foundation

/* Anime API
struct AnimeList: Decodable {
    let data: [Anime]
}
*/

//Airbnb

struct List {
    let searchResults: [Result]

//    enum Keys: String, CodingKey {
//        case searchResults = "search_results"
//    }
}

extension List: Decodable {
    enum Keys: String, CodingKey {
        case searchResults = "search_results"
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: Keys.self)
        let searchResults = try container.decode([Result].self, forKey: .searchResults)
        
        self.init(searchResults: searchResults)
    }
}

