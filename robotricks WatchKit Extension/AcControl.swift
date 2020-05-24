//
//  AcControl.swift
//  robotricks WatchKit Extension
//
//  Created by Jhonatan Silva de Sousa on 23/05/20.
//  Copyright © 2020 Jhonatan Silva de Sousa. All rights reserved.
//

import Foundation
import WatchKit
import CoreMotion

class AcControl: WKInterfaceController {
    
    @IBOutlet weak var labelX: WKInterfaceLabel!
    let motionManager = CMMotionManager()
    
    @IBOutlet weak var move: WKInterfaceSlider!
    
   override func awake(withContext context: Any?) {
       super.awake(withContext: context)
    motionManager.deviceMotionUpdateInterval = 5000.0
   }
    
    @IBAction func chang(_ value: Float) {
      print(value)
        send(x:Int(value))
    }
    
    override func willActivate() {
        super.willActivate()
        /*if (motionManager.isAccelerometerAvailable == true) { //o erro estavan no error?
                   let handler:CMAccelerometerHandler = {(data: CMAccelerometerData?, error: Error?) -> Void in
                        self.labelX.setText(String(format: "%.1f", data!.acceleration.x))
                    let cont:Int =  Int(data!.acceleration.x)
                
                   print(cont)
                        
                    
                     self.send(x:String(format: "%.1f", data!.acceleration.x))
                     
                   }
            motionManager.startAccelerometerUpdates(to: OperationQueue.current!, withHandler: handler)
        }*/
        move.setColor(UIColor.orange)
    
    }
  
    override func didDeactivate() {
        super.didDeactivate()
        motionManager.stopDeviceMotionUpdates()
    }
    
    func send(x:Int){
        var task: URLSessionDataTask?
        let url = URL(string:"http://192.168.15.11:1880/api?x=\(x)")!
        let session = URLSession(configuration: URLSessionConfiguration.default)
        
        task = session.dataTask(with: url){ (data, res, error) -> Void in
            if let e = error {
                print("dataTaskWithURL fail: \(e.localizedDescription)")
                return
            }
            if let d = data {}
        }
        task!.resume()
    }
   
}
