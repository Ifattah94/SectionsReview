//
//  SeasonOrganizer.swift
//  IramTableViewSections
//
//  Created by C4Q on 4/13/20.
//  Copyright © 2020 Iram Fattah. All rights reserved.
//

import Foundation

struct SeasonOrganizer {
    
    //compiles all the season numbers from each episode into a single array
    public func seasonNumbers(from episodes: [Episode]) -> [Int] {
        var seasonNumbers = Set<Int>()
        for episode in episodes {
            seasonNumbers.insert(episode.season)
        }
        return seasonNumbers.map { $0 }
    }
    
    
    public func createSeasons(from episodes: [Episode]) -> [Season] {
        //creates an array of season objects with empty episodes. but the seasons are sorted by number
        var seasons = seasonNumbers(from: episodes)
            .map { Season(episodes: [], number: $0) }
            .sorted(by: { $0.number < $1.number })
        
        for episode in episodes {
            guard let matchingSeason = seasons.first(where: { $0.number == episode.season } ),
                  let seasonIndex = seasons.firstIndex(of: matchingSeason) else {continue}
            seasons[seasonIndex].episodes.append(episode)
        }
        
        return seasons.map { season in
            Season(episodes: season.episodes.sorted { $0.number < $1.number }, number: season.number)
        }

    }
    
    
}
