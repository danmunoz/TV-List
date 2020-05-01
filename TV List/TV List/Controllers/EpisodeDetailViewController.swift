//
//  EpisodeDetailViewController.swift
//  TV List
//
//  Created by Daniel Munoz on 3/1/18.
//  Copyright © 2018 Daniel Munoz. All rights reserved.
//

import UIKit
import AlamofireImage

final class EpisodeDetailViewController: UIViewController {

    var episode: Episode?
    
    @IBOutlet weak var seasonNumberLabel: UILabel!
    @IBOutlet weak var episodeNumberLabel: UILabel!
    @IBOutlet weak var showNameLabel: UILabel!
    @IBOutlet weak var episodeNameLabel: UILabel!
    @IBOutlet weak var episodeImageView: UIImageView!
    @IBOutlet weak var episodeSummaryLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var runningTimeLabel: UILabel!
    @IBOutlet weak var networkLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    // MARK: - Functions
    private func setupUI() {
        self.title = "Episode Info"
        self.showNameLabel.text = self.episode?.show?.name
        self.episodeNameLabel.text = self.episode?.name
        self.episodeNumberLabel.text = "Ep.: " + String((self.episode?.number)!)
        self.seasonNumberLabel.text = "Season: " + String((self.episode?.season)!)
        self.episodeImageView.af_setImage(withURL: URL(string: (self.episode?.show?.image?.medium)!)!)
        self.episodeSummaryLabel.text = self.episode?.summary?.htmlToString
        self.timeLabel.text = self.episode?.airTime
        self.runningTimeLabel.text = String((self.episode?.runtime)!)
        self.networkLabel.text = self.episode?.show?.network?.name
    }

    @IBAction func showDetailAction(_ sender: UIButton) {
        performSegue(withIdentifier: "ShowDetailSegue", sender: self)
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowDetailSegue" {
            let vc = segue.destination as! ShowDetailViewController
            vc.show = self.episode?.show
            vc.imagePlaceholder = self.episodeImageView.image
        }
    }

}
