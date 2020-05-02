//
//  EpisodeDetailViewController.swift
//  TV List
//
//  Created by Daniel Munoz on 3/1/18.
//  Copyright © 2018 Daniel Munoz. All rights reserved.
//

import UIKit

final class EpisodeDetailViewController: UIViewController {

    var episode: Episode?
    
    @IBOutlet private weak var seasonNumberLabel: UILabel!
    @IBOutlet private weak var episodeNumberLabel: UILabel!
    @IBOutlet private weak var showNameLabel: UILabel!
    @IBOutlet private weak var episodeNameLabel: UILabel!
    @IBOutlet private weak var episodeImageView: UIImageView!
    @IBOutlet private weak var episodeSummaryLabel: UILabel!
    @IBOutlet private weak var timeLabel: UILabel!
    @IBOutlet private weak var runningTimeLabel: UILabel!
    @IBOutlet private weak var networkLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
    }

    // MARK: - Functions
    private func setupUI() {
        guard let episode = self.episode else {
            return
        }
        self.title = "Episode Info"
        self.showNameLabel.text = episode.show?.name
        self.episodeNameLabel.text = episode.name
        self.episodeNumberLabel.text = "Ep.: " + String(episode.number)
        self.seasonNumberLabel.text = "Season: " + String(episode.season)
        self.episodeSummaryLabel.text = episode.summary?.htmlToString
        self.timeLabel.text = episode.airTime
        self.runningTimeLabel.text = String(episode.runtime)
        self.networkLabel.text = episode.show?.network?.name
        guard
            let mediumURLString = episode.show?.image?.medium,
            let url = URL(string: mediumURLString) else {
                return
        }
        self.episodeImageView.af_setImage(withURL: url)
    }

    @IBAction func showDetailAction(_ sender: UIButton) {
        performSegue(withIdentifier: "ShowDetailSegue", sender: self)
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowDetailSegue" {
            guard let vc = segue.destination as? ShowDetailViewController else { return }
            vc.show = self.episode?.show
            vc.imagePlaceholder = self.episodeImageView.image
        }
    }

}
