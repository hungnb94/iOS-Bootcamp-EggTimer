//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func hardnessSelected(_ sender: UIButton) {
        let hardness = sender.currentTitle
        switch (hardness) {
        case "Soft":
            print(5)
        case "Medium":
            print(7)
        case "Hard":
            print(12)
        default:
            print(-1)
        }
    }


}
