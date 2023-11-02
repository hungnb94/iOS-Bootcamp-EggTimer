//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let eggTimes = ["Soft": 5 * 60, "Medium": 7 * 60, "Hard": 12 * 60]
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        let hardness = sender.currentTitle!
        
        var count = eggTimes[hardness]!
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            if(count > 0) {
                print("\(count) seconds")
                count -= 1
            }
            
        }
    }
}
