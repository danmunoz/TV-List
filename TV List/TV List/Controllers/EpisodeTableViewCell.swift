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
    
    @IBOutlet weak var episodeNameLabel: UILabel!
    @IBOutlet weak var showNameLabel: UILabel!
    @IBOutlet weak var episodeImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.episodeImageView.af_cancelImageRequest()
        self.episodeImageView.image = nil
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func update(with episode: Episode) {
        self.showNameLabel.text = episode.show?.name
        self.episodeNameLabel.text = episode.name
        guard
            let urlString = episode.show?.image?.medium,
            let url = URL(string: urlString) else {
            return
        }
        self.episodeImageView.af_setImage(withURL: url)
    }
}
