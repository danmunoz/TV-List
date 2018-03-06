//
//  EpisodeDetailViewController.swift
//  TV List
//
//  Created by Daniel Munoz on 3/1/18.
//  Copyright © 2018 Daniel Munoz. All rights reserved.
//

import UIKit
import AlamofireImage

class EpisodeDetailViewController: UIViewController {

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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Functions
    fileprivate func setupUI() {
        showNameLabel.text = episode?.show?.name
        episodeNameLabel.text = episode?.name
        episodeNumberLabel.text = "Ep.: " + String((episode?.number)!)
        seasonNumberLabel.text = "Season: " + String((episode?.season)!)
        episodeImageView.af_setImage(withURL: URL(string: (episode?.show?.image?.medium)!)!)
        episodeSummaryLabel.text = episode?.summary?.htmlToString
        timeLabel.text = episode?.airTime
        runningTimeLabel.text = String((episode?.runtime)!)
        networkLabel.text = episode?.show?.network?.name
    }

    @IBAction func showDetailAction(_ sender: UIButton) {
        performSegue(withIdentifier: "ShowDetailSegue", sender: self)
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowDetailSegue" {
            let vc = segue.destination as! ShowDetailViewController
            vc.show = episode?.show
            vc.imagePlaceholder = episodeImageView.image
        }
    }

}
