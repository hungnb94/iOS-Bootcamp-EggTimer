//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let eggTimes = ["Soft": 5 * 1, "Medium": 7 * 1, "Hard": 12 * 1]
    
    var timer = Timer()
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var progressView: UIProgressView!
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        progressView.progress = 1
        
        timer.invalidate()

        let hardness = sender.currentTitle!
        
        var secondsRemaining = eggTimes[hardness]!
        let totalTime = secondsRemaining
        
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            if(secondsRemaining > 0) {
                secondsRemaining -= 1
                self.progressView.progress = Float(secondsRemaining) / Float(totalTime)
            } else {
                self.titleLabel.text = "Done!"
                timer.invalidate()
            }
        }
    }
}
