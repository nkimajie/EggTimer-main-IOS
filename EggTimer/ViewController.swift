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
    
    var player: AVAudioPlayer!

    
    let eggTimes = ["Soft": 3, "Medium": 4, "Hard": 7]
    var totalTime = 0
    var secondsPassed = 0

    
    var timer = Timer()

    @IBOutlet weak var topLabel: UILabel!
    
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
                
        timer.invalidate()
        let hardness = sender.currentTitle!
        totalTime = eggTimes[hardness]!
        
        progressBar.progress = 0.0
        secondsPassed = 0
        topLabel.text = hardness
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector:
            #selector(countDown), userInfo: nil, repeats: true)
    }
    @objc func countDown() {
         if secondsPassed < totalTime {
             secondsPassed += 1
             progressBar.progress = Float(secondsPassed) / Float(totalTime)
             
             print(Float(secondsPassed) / Float(totalTime))
        
         }else{
             let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
                     player = try! AVAudioPlayer(contentsOf: url!)
                     player.play()
             
             timer.invalidate()
             topLabel.text = "DONE"
             
         }
    }

}
