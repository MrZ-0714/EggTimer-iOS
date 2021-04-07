//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    let eggTime : [String: Int] = ["Soft": 5, "Medium": 7, "Hard": 12]
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        let hardness = sender.currentTitle!
        var secondsRemaining = self.eggTime[hardness]!
        print(eggTime[hardness]!)
        
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { (Timer) in
               if secondsRemaining > 0 {
                   print ("\(secondsRemaining) seconds")
                   secondsRemaining -= 1
               } else {
                   Timer.invalidate()
               }
           }
    }
    
}
