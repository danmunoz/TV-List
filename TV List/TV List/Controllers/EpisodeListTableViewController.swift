//
//  EpisodeListTableViewController.swift
//  TV List
//
//  Created by Daniel Munoz on 3/1/18.
//  Copyright © 2018 Daniel Munoz. All rights reserved.
//

import UIKit

final class EpisodeListTableViewController: UITableViewController {
    
    private var episodesArray = [Episode]()
    private var selectedEpisode: Episode?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.estimatedRowHeight = 150
        self.fetchEpisodes()
        self.setupUI()
        self.refreshControl = UIRefreshControl()
        let string = "Pull to refresh"
        let attributtedText = NSMutableAttributedString.init(string: string)
        let range = (string as NSString).range(of: string)
        attributtedText.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.white , range: range)
        self.refreshControl?.attributedTitle = attributtedText
        self.refreshControl?.addTarget(self, action: #selector(self.handleRefresh), for: UIControl.Event.valueChanged)
        
    }

    // MARK: - Functions
    
    @objc func handleRefresh() {
        self.fetchEpisodes()
        refreshControl?.endRefreshing()
    }
    
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
        if #available(iOS 11.0, *) {
            self.navigationController?.navigationBar.prefersLargeTitles = true
            navigationItem.hidesSearchBarWhenScrolling = true
        }
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.episodesArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EpisodeCell", for: indexPath) as! EpisodeTableViewCell
        let episode = self.episodesArray[indexPath.row]
        cell.episode = episode
        cell.setupUI()
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        self.selectedEpisode = episodesArray[indexPath.row]
        performSegue(withIdentifier: "EpisodeDetailSegue", sender: self)
    }

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "EpisodeDetailSegue" {
            let vc = segue.destination as! EpisodeDetailViewController
            vc.episode = self.selectedEpisode
        }
    }
    

}
