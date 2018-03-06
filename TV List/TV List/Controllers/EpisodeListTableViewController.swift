//
//  EpisodeListTableViewController.swift
//  TV List
//
//  Created by Daniel Munoz on 3/1/18.
//  Copyright © 2018 Daniel Munoz. All rights reserved.
//

import UIKit

class EpisodeListTableViewController: UITableViewController {
    
    var episodesArray = [Episode]()
    var selectedEpisode: Episode?

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 150
        fetchEpisodes()
        setupUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Functions
    
    fileprivate func fetchEpisodes() {
        APIManager.getSchedule(success: { (episodes) in
            if let episodes = episodes {
                self.episodesArray = episodes
                self.tableView.reloadData()
            }
        }) { (error) in
            if let error = error {
                print("Error fetching schedule: \(error)")
            }
        }
    }
    
    fileprivate func setupUI() {
        title = "Schedule"
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return episodesArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EpisodeCell", for: indexPath) as! EpisodeTableViewCell
        let episode = episodesArray[indexPath.row]
        cell.episode = episode
        cell.setupUI()
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        selectedEpisode = episodesArray[indexPath.row]
        performSegue(withIdentifier: "EpisodeDetailSegue", sender: self)
    }

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "EpisodeDetailSegue" {
            let vc = segue.destination as! EpisodeDetailViewController
            vc.episode = selectedEpisode
        }
    }
    

}
