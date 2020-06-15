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
                    
                    let contX = self.convertAxy(axy: data!.acceleration.x)
                    let contY = self.convertAxy(axy: data!.acceleration.y)
                    let contZ = self.convertAxy(axy: data!.acceleration.z)
                 
                    if(contZ > 0){
                        self.btn.setBackgroundColor(UIColor.red)
                    }else{
                        self.btn.setBackgroundColor(UIColor.green)
                    }
                   
                    self.labelX.setText(String("X: \(contX)"))
                    self.label_y.setText(String("Y: \(contY)"))
                    self.label_z.setText(String("Z \(contZ)"))
                    //self.send(x: cont)
                   }
            motionManager.startAccelerometerUpdates(to: OperationQueue.current!, withHandler: handler)
        }
    
    }
  
    override func didDeactivate() {
        super.didDeactivate()
        motionManager.stopDeviceMotionUpdates()
    }
    
    func convertAxy(axy:Double) -> Int {
        return Int(axy * 100)
    }
    
    func send(x:Int, y:Int,z:Int){
        var task: URLSessionDataTask?
        let url = URL(string:"http://192.168.15.17:1880/api?x=\(x)&y=\(y)&z=\(z)")!
        let session = URLSession(configuration: URLSessionConfiguration.default)
        
        task = session.dataTask(with: url){ (data, res, error) -> Void in
            if let e = error {
                print("dataTaskWithURL fail: \(e.localizedDescription)")
                return
            }
            //if let d = data {}
        }
        task!.resume()
    }
   
}
