//
//  ViewController.swift
//  JSON_Practice
//
//  Created by Kaichi Momose on 2017/10/27.
//  Copyright © 2017 Kaichi Momose. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let networking = Networking()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        /* JOKE API
        networking.getJoke() { (jokes: [Joke]) in
            print(jokes)
        }
         */
        
        /* Anime API
        networking.getAnime(id: "1") { (anime: Anime) in
            print(anime)
        }
         */
        
        // Airbnb API
        networking.getResults() { (results: [Result]) in
            print(results)
        }

        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
}

