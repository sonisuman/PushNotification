//
//  ViewController.swift
//  LocalPushNotifications
//
//  Created by Soni Suman on 31/05/20.
//  Copyright © 2020 Soni Suman. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        UNService.shared.authorize()
        CLService.shared.authorize()
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(didEnterRegion),
                                               name: NSNotification.Name("internalNotification.enteredRegion"),
                                               object: nil)
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(handleAction(_:)),
                                               name: NSNotification.Name("internalNotification.handleAction"),
                                               object: nil)
    }
    @IBAction func timerButtonPressed(_ sender: UIButton) {
        AlertService.actionSheet(in: self, title: "5 seconds") {
            UNService.shared.timerRequest(with: 5)
        }
    }
    
    
    @IBAction func locationButtonPressed(_ sender: UIButton) {
        AlertService.actionSheet(in: self, title: "When I return") {
            CLService.shared.updateLocation()
        }
    }
    
    @IBAction func dateButtonPressed(_ sender: UIButton) {
        AlertService.actionSheet(in: self, title: "Some future time") {
                   var components = DateComponents()
                   components.second = 0
                   
                   UNService.shared.dateRequest(with: components)
               }
    }
    @objc
     func didEnterRegion() {
         UNService.shared.locationRequst()
     }
     
     @objc
     func handleAction(_ sender: Notification) {
         guard let action = sender.object as? NotificationActionID else { return }
         switch action {
         case .timer: print("timer logic")
         case .date: print("date logic")
         case .location: changeBackground()
         }
     }
     
     func changeBackground() {
         view.backgroundColor = .red
     }
    
}

