//
//  EpisodeParsingService.swift
//  IramTableViewSections
//
//  Created by C4Q on 4/13/20.
//  Copyright © 2020 Iram Fattah. All rights reserved.
//

import Foundation

struct EpisodeParsingService {
    func getArray(from resource: String, ofType type: String) -> [Episode] {
        guard let pathToData = Bundle.main.path(forResource: resource, ofType: type) else {
            fatalError("\(resource).\(type) file not found")
        }
        let internalUrl = URL(fileURLWithPath: pathToData)
        do {
            let data = try Data(contentsOf: internalUrl)
            return try JSONDecoder().decode([Episode].self, from: data)
        }
        catch {
            fatalError("An error occurred: \(error)")
        }
    }

}

