//
//  StarWarsFile.swift
//  UnitTestingLab
//
//  Created by Oscar Victoria Gonzalez  on 12/2/19.
//  Copyright © 2019 Oscar Victoria Gonzalez . All rights reserved.
//

import Foundation

struct StarWarsData: Codable {
    let results: [MovieData]
}

struct MovieData: Codable {
    let title: String
    let opening_crawl: String
}

extension StarWarsData {
    static func getData() -> [MovieData] {
        var movie = [MovieData]()
        guard let fileURL = Bundle.main.url(forResource: "starWars", withExtension: "json") else {
            fatalError("could not locate json file")
        }
        do {
            let data = try Data(contentsOf: fileURL)
            let movieData = try JSONDecoder().decode(StarWarsData.self, from: data)
            movie = movieData.results
        } catch {
            fatalError("error: \(error)")
        }
        return movie
    }
}
