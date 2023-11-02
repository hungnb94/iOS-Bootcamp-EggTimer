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
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        timer.invalidate()

        let hardness = sender.currentTitle!
        
        var count = eggTimes[hardness]!
        
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            if(count > 0) {
                print("\(count) seconds")
                count -= 1
            } else {
                self.titleLabel.text = "Done!"
                timer.invalidate()
            }
        }
    }
}
