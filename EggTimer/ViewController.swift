//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    let eggTimes = ["Soft": 5 * 1, "Medium": 7 * 1, "Hard": 12 * 1]

    var timer = Timer()

    var totalTime = 0

    var secondsPassed = 0

    @IBOutlet weak var titleLabel: UILabel!

    @IBOutlet weak var progressView: UIProgressView!
    
    var player: AVAudioPlayer!

    @IBAction func hardnessSelected(_ sender: UIButton) {
        timer.invalidate()

        let hardness = sender.currentTitle!

        totalTime = eggTimes[hardness]!
        progressView.progress = 0
        secondsPassed = 0
        titleLabel.text = hardness

        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
    }

    @objc func updateTime() {
        if secondsPassed < totalTime {
            secondsPassed += 1
            let percentageProgress = Float(secondsPassed) / Float(totalTime)
            progressView.progress = percentageProgress
        } else {
            titleLabel.text = "DONE!"
            timer.invalidate()
            playSound()
        }
    }
    
    func playSound() {
        let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")!
        player = try! AVAudioPlayer(contentsOf: url)
        player.play()
    }
}
