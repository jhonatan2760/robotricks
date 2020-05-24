//
//  HostingController.swift
//  robotricks WatchKit Extension
//
//  Created by Jhonatan Silva de Sousa on 23/05/20.
//  Copyright © 2020 Jhonatan Silva de Sousa. All rights reserved.
//

import WatchKit
import Foundation
import SwiftUI
import CoreMotion

class HostingController: WKHostingController<ContentView> {
    
    @IBOutlet weak var labelX: WKInterfaceLabel!
    let motionManager = CMMotionManager()

    override var body: ContentView {
        return ContentView()
    }
  
    
}
