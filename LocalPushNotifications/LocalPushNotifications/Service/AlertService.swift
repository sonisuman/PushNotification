//
//  AlertService.swift
//  Remind
//
//  Created by Kyle Lee on 9/10/17.
//  Copyright © 2017 Kyle Lee. All rights reserved.
//

import UIKit

class AlertService {
    
    private init() {}
    
    static func actionSheet(in vc: UIViewController, title: String, completion: @escaping () -> Void) {
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let action = UIAlertAction(title: title, style: .default) { (_) in
            completion()
        }
        alert.addAction(action)
        vc.present(alert, animated: true)
    }
}
