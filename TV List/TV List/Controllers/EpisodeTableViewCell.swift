//
//  EpisodeTableViewCell.swift
//  TV List
//
//  Created by Daniel Munoz on 3/1/18.
//  Copyright © 2018 Daniel Munoz. All rights reserved.
//

import UIKit
import AlamofireImage

class EpisodeTableViewCell: UITableViewCell {
    
    var episode: Episode?

    @IBOutlet weak var episodeNameLabel: UILabel!
    @IBOutlet weak var showNameLabel: UILabel!
    @IBOutlet weak var episodeImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        episodeImageView.af_cancelImageRequest()
        episodeImageView.image = nil
    }
    
    func setupUI() {
        showNameLabel.text = episode?.show?.name
        episodeNameLabel.text = episode?.name
        guard let episode = episode else {
            return
        }
        episodeImageView.af_setImage(withURL: URL(string: (episode.show?.image?.medium)!)!)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
