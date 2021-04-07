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
    var hardness = ""
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        timer.invalidate()
        hardness = sender.currentTitle!
        secondsRemaining = self.eggTime[hardness]!
        titleLabel.text = "Cookign an \(hardness) egg!"
        
        print(eggTime[hardness]!)
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo:nil, repeats: true)

        }
    
    @objc func updateTimer() {
        if secondsRemaining >= 0 {
            print("\(secondsRemaining) seconds remaining")
            secondsRemaining -= 1
            
            progressBar.progress = 1 - Float((Float(secondsRemaining) / Float(self.eggTime[hardness]!)))

        };
        if secondsRemaining < 0 {
            timer.invalidate()
            titleLabel.text = "EGG IS DONE!"
        }
    }
    
}
