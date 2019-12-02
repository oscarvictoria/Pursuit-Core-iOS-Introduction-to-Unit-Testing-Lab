//
//  JokeFile.swift
//  UnitTestingLab
//
//  Created by Oscar Victoria Gonzalez  on 12/2/19.
//  Copyright © 2019 Oscar Victoria Gonzalez . All rights reserved.
//

import Foundation

struct Jokes: Codable {
    let setup: String
    let punchline: String
}

extension Jokes {
    static func getJokes() -> [Jokes] {
        var joke = [Jokes]()
        guard let fileURL = Bundle.main.url(forResource: "joke-api", withExtension: "json") else {
        fatalError("could not locate json file")

    }
        do {
            let data = try Data(contentsOf: fileURL)
            let jokesData = try JSONDecoder().decode([Jokes].self, from: data)
            joke = jokesData
        } catch {
            print("failed to load contents")
        }
        return joke
}
 
}
