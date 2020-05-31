//
//  ShadowView.swift
//  LocalPushNotifications
//
//  Created by Soni Suman on 31/05/20.
//  Copyright © 2020 Soni Suman. All rights reserved.
//

import UIKit

class ShadowView: UIView {
    
    override  func awakeFromNib() {
        layer.shadowPath = CGPath(rect: layer.bounds, transform: nil)
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 1, height: 1)
        layer.shadowOpacity = 1
        layer.shadowRadius = 5
        layer.cornerRadius = 5
    
    }
}
