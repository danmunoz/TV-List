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
    @IBOutlet weak var showNameLabel: UILabel!
    @IBOutlet weak var showImageView: UIImageView!
    @IBOutlet weak var showSummaryLabel: UILabel!
    @IBOutlet weak var showDaysLabel: UILabel!
    @IBOutlet weak var showPremiereLabel: UILabel!
    @IBOutlet weak var showTypeLabel: UILabel!
    
    //MARK: - View Controller Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    //MARK: - Functions
    private func setupUI() {
        self.title = "Show Detail"
        self.showNameLabel.text = self.show?.name
        self.showImageView.af_setImage(withURL: URL(string: (self.show?.image?.original)!)!, placeholderImage: self.imagePlaceholder, filter: nil, progress: nil, progressQueue: DispatchQueue.main, imageTransition: UIImageView.ImageTransition.crossDissolve(1), runImageTransitionIfCached: false, completion: nil)
        self.showSummaryLabel.text = self.show?.summary?.htmlToString
        self.showTypeLabel.text = self.show?.type
        self.showPremiereLabel.text = self.show?.premiered?.getString(format: "MM/dd/yyyy")
        self.showDaysLabel.text = self.show?.schedule?.days.joined(separator: ", ")
    }

}
