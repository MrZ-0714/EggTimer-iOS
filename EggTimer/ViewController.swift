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
    var timer = Timer()
    var secondsRemaining = 60
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        timer.invalidate()
        
        let hardness = sender.currentTitle!
        secondsRemaining = self.eggTime[hardness]!
        print(eggTime[hardness]!)
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo:nil, repeats: true)

        }
    
    @objc func updateTimer() {
        if secondsRemaining > 0 {
            print("\(secondsRemaining) seconds remaining")
            secondsRemaining -= 1
        };
        if secondsRemaining == 0 {
            titleLabel.text = "DONE!"
        }
    }
    
}
