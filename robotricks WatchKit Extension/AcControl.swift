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
    
    @IBOutlet weak var btn: WKInterfaceButton!
    @IBOutlet weak var labelX: WKInterfaceLabel!
    let motionManager = CMMotionManager()
    @IBOutlet weak var direction_label: WKInterfaceLabel!
    @IBOutlet weak var label_y: WKInterfaceLabel!
    @IBOutlet weak var label_z: WKInterfaceLabel!
    
    @IBOutlet weak var verde: WKInterfaceButton!
    @IBOutlet weak var vermelho: WKInterfaceButton!
    //@IBOutlet weak var move: WKInterfaceSlider!
    
   override func awake(withContext context: Any?) {
       super.awake(withContext: context)
       motionManager.deviceMotionUpdateInterval = 3.1
       motionManager.accelerometerUpdateInterval = 2.0
   }
    
    
    
   /* @IBAction func chang(_ value: Float) {
      print(value)
        //send(x:Int(value))
    } */
    
    override func willActivate() {
        super.willActivate()
        motionManager.deviceMotionUpdateInterval = 3.1
        //motionManager.accelerometerUpdateInterval = 2.0
        if (motionManager.isAccelerometerAvailable == true) { //o erro estavan no error?
                   let handler:CMAccelerometerHandler = {(data: CMAccelerometerData?, error: Error?) -> Void in
                        self.labelX.setText(String(format: "%.1f", data!.acceleration.x))
                  
                    self.label_y.setText(String(format: "%.1f", data!.acceleration.y))
                    
                    self.label_z.setText(String(format: "%.1f", data!.acceleration.z))
                    
                    let cont = Int(data!.acceleration.x * 100)
                    
                    //if(cont == 5 || cont == -5){
                       print(cont)
                        //self.send(x: cont)
                    //}
                    
                    if(cont > 0){
                        self.btn.setBackgroundColor(UIColor.red)
                    }else{
                        self.btn.setBackgroundColor(UIColor.green)
                    }
                    //self.send(x: cont)
                    self.labelX.setText(String(cont))
                    //self.send(x: cont)
                   }
            motionManager.startAccelerometerUpdates(to: OperationQueue.current!, withHandler: handler)
        }
        //move.setColor(UIColor.orange)
    
    }
  
    override func didDeactivate() {
        super.didDeactivate()
        motionManager.stopDeviceMotionUpdates()
    }
    
    
    func send(x:Int){
        var task: URLSessionDataTask?
        let url = URL(string:"http://192.168.15.17:1880/api?x=\(x)")!
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
