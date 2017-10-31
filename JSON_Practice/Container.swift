//
//  Container.swift
//  JSON_Practice
//
//  Created by Kaichi Momose on 2017/10/27.
//  Copyright © 2017 Kaichi Momose. All rights reserved.
//

import Foundation

/* JOKE API
struct Joke {
    let id: Int
    let type: String
    let setup: String
    let punchline: String
}

extension Joke: Decodable {

    enum Keys: String, CodingKey{
        case id
        case type
        case setup
        case punchline
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: Keys.self)
        id = try container.decode(Int.self, forKey: .id)
        type = try container.decode(String.self, forKey: .type)
        setup = try container.decode(String.self, forKey: .setup)
        punchline = try container.decode(String.self, forKey: .punchline)
    }
}
*/

/* Anime API
struct Anime {
    let title: String
    let thumbnail: URL
    let id: String

    init(title: String, thumbnail: URL, id: String) {
        self.title = title
        self.thumbnail = thumbnail
        self.id = id
    }
}

extension Anime: Decodable {

    // Declaring our keys
    enum Keys: String, CodingKey {
        case id
        case attributes
    }

    enum TitleKeys: String, CodingKey {
        case en = "en"
        case en_jp
    }

    enum ThumbnailKeys: String, CodingKey {
        case thumbnail = "original"
    }

    enum AttributeKey: String, CodingKey {
        case titles
        case posterImage
    }

    init(from decoder: Decoder) throws {

        let container = try decoder.container(keyedBy: Keys.self) // defining our (keyed) container

        // Attributes Container
        let attributesContainer = try container.nestedContainer(keyedBy: AttributeKey.self, forKey: .attributes)

        // Container holding title
        let titlesEnContainer = try attributesContainer.nestedContainer(keyedBy: TitleKeys.self, forKey: .titles)

        let title: String = try titlesEnContainer.decodeIfPresent(String.self, forKey: .en) ?? "" //decodeIfPresent -> optional

        // Id - top level in data array
        let id: String = try container.decode(String.self, forKey: .id)

        //        // Poster Image
        let thumbnailContainer = try attributesContainer.nestedContainer(keyedBy: ThumbnailKeys.self, forKey: .posterImage)
        //
        let thumbnail: URL = try thumbnailContainer.decode(URL.self, forKey: .thumbnail)

        self.init(title: title, thumbnail: thumbnail, id: id)
    }
}
*/

// Airbnb API
struct Result {
    let bathrooms: Float
    let firstName: String

}

extension Result: Decodable {
    enum Keys: String, CodingKey {
        case listing
    }

    enum ListingKeys: String, CodingKey {
        case bathrooms
        case user
    }

    enum UserKeys: String, CodingKey {
        case firstName = "first_name"
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: Keys.self)
        let listing = try container.nestedContainer(keyedBy: ListingKeys.self, forKey: .listing)
        let bathrooms = try listing.decodeIfPresent(Float.self, forKey: .bathrooms) ?? 0
        let user = try listing.nestedContainer(keyedBy: UserKeys.self, forKey: .user)
        let firstName = try user.decode(String.self, forKey: .firstName)
        self.init(bathrooms: bathrooms, firstName: firstName)
    }

    
    
}

