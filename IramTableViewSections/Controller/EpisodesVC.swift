//
//  EpisodesVC.swift
//  IramTableViewSections
//
//  Created by C4Q on 4/13/20.
//  Copyright © 2020 Iram Fattah. All rights reserved.
//

import UIKit

class EpisodesVC: UITableViewController {

    
    var seasons = [Season]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()

       
    }
    
    
    private func loadData() {
        let episodeParsingService = EpisodeParsingService()
        let seasonOrganizer = SeasonOrganizer()
        var episodes = [Episode]()
        DispatchQueue.global(qos: .default).async {
            episodes = episodeParsingService.getArray(from: "episodes", ofType: "json")
            DispatchQueue.main.async {
                self.seasons = seasonOrganizer.createSeasons(from: episodes)
            }
        }
    }

    // MARK: - Table view data source

    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return seasons.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EpisodeCell", for: indexPath)
        let episodes = seasons[indexPath.section].episodes
        let episode = episodes[indexPath.row]
        
        cell.textLabel?.text = episode.name
        cell.detailTextLabel?.text = "Season \(episode.season) Episode \(episode.number)"
        return cell
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return seasons[section].episodes.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Season \(seasons[section].number)" 
    }

    

}
