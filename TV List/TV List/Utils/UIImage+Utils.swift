//
//  UIImage+Utils.swift
//  TV List
//
//  Created by Daniel Munoz on 02.05.20.
//  Copyright © 2020 Daniel Munoz. All rights reserved.
//

import Foundation
import UIKit

private var UIImageViewCacheKey: UInt8 = 0

//Still needs some fixes in order to properly cache images.
extension UIImageView {

    private var imageCache: NSCache<NSString, UIImage>? {
        get { return objc_getAssociatedObject(self, &UIImageViewCacheKey) as? NSCache<NSString, UIImage> }
        set { objc_setAssociatedObject(self, &UIImageViewCacheKey, newValue, .OBJC_ASSOCIATION_RETAIN) }
    }

    func loadImage(from url: URL) {
        if self.imageCache == nil {
            self.imageCache = NSCache<NSString, UIImage>()
        }
        if let imageFromCache = self.imageCache?.object(forKey: url.absoluteString as NSString) {
            DispatchQueue.main.async {
                self.image = imageFromCache
            }
            return
        }
        URLSession.shared.dataTask(with: url) { result in
            if case .success(let data) = result {
                guard let image = UIImage(data: data) else {
                    return
                }
                self.imageCache?.setObject(image, forKey: url.absoluteString as NSString)
                DispatchQueue.main.async {
                    self.image = image
                }
            }
        }
    }
}
