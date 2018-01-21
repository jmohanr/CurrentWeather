//
//  UIImage.swift
//  WeatherApp
//
//  Created by Ammulu on 09/01/18.
//  Copyright © 2018 JaganMohan. All rights reserved.
//

import Foundation
import UIKit
extension UIImageView {
    func makeBloorImage(targetImageView:UIImageView) {
        let bloor = UIBlurEffect(style: UIBlurEffectStyle.dark)
        let bloorView = UIVisualEffectView(effect: bloor)
        bloorView.alpha = 0.5
        bloorView.frame = targetImageView.bounds
        
        bloorView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        targetImageView.addSubview(bloorView)
    }
}
