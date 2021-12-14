//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
let eggTimes = ["Soft": 10, "Medium": 15, "Hard": 20]
    
    var secondsRemaining = 60
    
    var timer = Timer()

    @IBOutlet weak var topLabel: UILabel!
    
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        progressBar.progress = 1.0
        
        timer.invalidate()
        
        let hardness = sender.currentTitle!

        secondsRemaining = eggTimes[hardness]!

        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector:
            #selector(countDown), userInfo: nil, repeats: true)
    }
    @objc func countDown() {
         if secondsRemaining > 0 {
             print("\(secondsRemaining) seconds.")
            secondsRemaining -= 1
             topLabel.text = "\(secondsRemaining)"
        
         }else{
             timer.invalidate()
             topLabel.text = "DONE"
             
         }
    }

}
