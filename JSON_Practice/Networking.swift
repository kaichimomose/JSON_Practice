//
//  Networking.swift
//  JSON_Practice
//
//  Created by Kaichi Momose on 2017/10/27.
//  Copyright © 2017 Kaichi Momose. All rights reserved.
//

import Foundation

/* JOKE API
class Networking {
    let session = URLSession.shared
    let baseURL = URL(string: "https://08ad1pao69.execute-api.us-east-1.amazonaws.com/dev/random_ten")!
    func getJoke(completion: @escaping ([Joke]) -> Void) {

        let request = URLRequest(url: baseURL)

        session.dataTask(with: request) { (data, resp, err) in
            if let data = data {

                let jokeList = try? JSONDecoder().decode([Joke].self, from: data)

                guard let jokes = jokeList else {return}
                completion(jokes)

            }
            }.resume()
    }
}
*/

/* Anime API
class Networking {
    let session = URLSession.shared
    let baseURL = URL(string: "https://kitsu.io/api/edge/anime")!

    func getAnime(id: String, completion: @escaping (Anime) -> Void) {

        let request = URLRequest(url: baseURL)

        session.dataTask(with: request) { (data, resp, err) in
            if let data = data {

                let animeList = try? JSONDecoder().decode(AnimeList.self, from: data)

                guard let animes = animeList?.data else {return}
                for anime in animes{
                    if anime.id == id {
                        completion(anime)
                    }
                }
            }
            }.resume()
    }
}
*/

// Airbnb API
 class Networking {
    let session = URLSession.shared
    let baseURL = URL(string: "https://api.airbnb.com/v2/search_results?key=915pw2pnf4h1aiguhph5gc5b2")!

    func getResults(completion: @escaping ([Result]) -> Void) {

        let request = URLRequest(url: baseURL)

        session.dataTask(with: request) { (data, resp, err) in
            if let data = data {

                let list = try? JSONDecoder().decode(List.self, from: data)
                guard let alist = list?.searchResults else {return}
                completion(alist)
            }
        }.resume()
    }
 }

