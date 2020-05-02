//
//  ShowDetailViewController.swift
//  TV List
//
//  Created by Daniel Munoz on 3/1/18.
//  Copyright © 2018 Daniel Munoz. All rights reserved.
//

import UIKit

final class ShowDetailViewController: UIViewController {
    
    var show: Show?
    var imagePlaceholder: UIImage?
    @IBOutlet private weak var showNameLabel: UILabel!
    @IBOutlet private weak var showImageView: UIImageView!
    @IBOutlet private weak var showSummaryLabel: UILabel!
    @IBOutlet private weak var showDaysLabel: UILabel!
    @IBOutlet private weak var showPremiereLabel: UILabel!
    @IBOutlet private weak var showTypeLabel: UILabel!
    
    //MARK: - View Controller Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
    }

    //MARK: - Functions
    private func setupUI() {
        self.title = "Show Detail"
        self.showNameLabel.text = self.show?.name
        self.showSummaryLabel.text = self.show?.summary?.htmlToString
        self.showTypeLabel.text = self.show?.type
        self.showPremiereLabel.text = self.show?.premiered
        self.showDaysLabel.text = self.show?.schedule?.days?.joined(separator: ", ")
        guard
            let originalURLString = self.show?.image?.original,
            let url = URL(string: originalURLString) else {
                return
        }
        self.showImageView.af_setImage(withURL: url, placeholderImage: self.imagePlaceholder, filter: nil, progress: nil, progressQueue: DispatchQueue.main, imageTransition: UIImageView.ImageTransition.crossDissolve(1), runImageTransitionIfCached: false, completion: nil)
    }
}
