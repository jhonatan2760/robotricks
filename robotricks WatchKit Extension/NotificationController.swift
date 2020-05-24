//
//  NotificationController.swift
//  robotricks WatchKit Extension
//
//  Created by Jhonatan Silva de Sousa on 23/05/20.
//  Copyright © 2020 Jhonatan Silva de Sousa. All rights reserved.
//

import WatchKit
import SwiftUI
import UserNotifications
import Foundation
import CoreMotion

class NotificationController: WKUserNotificationHostingController<NotificationView> {
    
    let motionManager = CMMotionManager()
    
    override var body: NotificationView {
        return NotificationView()
        motionManager.accelerometerUpdateInterval = 0.1
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        
        
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

    override func didReceive(_ notification: UNNotification) {
        // This method is called when a notification needs to be presented.
        // Implement it if you use a dynamic notification interface.
        // Populate your dynamic notification interface as quickly as possible.
    }
}
