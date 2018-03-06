//
//  ShowDetailViewController.swift
//  TV List
//
//  Created by Daniel Munoz on 3/1/18.
//  Copyright © 2018 Daniel Munoz. All rights reserved.
//

import UIKit

class ShowDetailViewController: UIViewController {
    
    var show: Show?
    var imagePlaceholder: UIImage?
    @IBOutlet weak var showNameLabel: UILabel!
    @IBOutlet weak var showImageView: UIImageView!
    
    //MARK: - View Controller Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK: - Functions
    fileprivate func setupUI() {
        showNameLabel.text = show?.name
        showImageView.af_setImage(withURL: URL(string: (show?.image?.original)!)!, placeholderImage: imagePlaceholder, filter: nil, progress: nil, progressQueue: DispatchQueue.main, imageTransition: UIImageView.ImageTransition.crossDissolve(1), runImageTransitionIfCached: false, completion: nil)
    }

}
